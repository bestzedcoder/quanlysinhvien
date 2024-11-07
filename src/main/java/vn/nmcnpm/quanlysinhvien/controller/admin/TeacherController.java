package vn.nmcnpm.quanlysinhvien.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Valid;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UploadService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherController {

    private UserService userService;
    private UploadService uploadService;
    private TeacherService teacherService;

    public TeacherController(UserService userService, UploadService uploadService, TeacherService teacherService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.teacherService = teacherService;
    }

    @GetMapping("/admin/teacher")
    public String getTeacherPage(Model model) {
        List<Teacher> teachers = this.teacherService.getAllTeachers();
        model.addAttribute("teachers", teachers);
        return "admin/teacher/show";
    }

    @GetMapping("/admin/teacher/{id}")
    public String getStudentDetailPage(Model model, @PathVariable long id) {
        Teacher teacher = this.teacherService.getTeacherById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("teacher", teacher);
        return "admin/teacher/detail";
    }

    @GetMapping("/admin/teacher/create")
    public String getCreateTeacherPage(Model model) {
        model.addAttribute("newTeacher", new Teacher());
        return "admin/teacher/create";
    }

    @PostMapping(value = "/admin/teacher/create")
    public String createTeacherPage(Model model,
            @ModelAttribute("newTeacher") @Valid Teacher teacher,
            BindingResult newTeacherBindingResult,
            @RequestParam("teacherAvatarFile") MultipartFile file) {

        if (newTeacherBindingResult.hasErrors()) {
            return "/admin/teacher/create";
        }

        // Kiểm tra lỗi của đối tượng user được liên kết
        User currentUser = teacher.getUser();
        if (currentUser != null) {
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            Validator validator = factory.getValidator();
            Set<ConstraintViolation<User>> violations = validator.validate(currentUser);

            if (!violations.isEmpty()) {
                for (ConstraintViolation<User> violation : violations) {
                    String propertyPath = violation.getPropertyPath().toString();
                    String message = violation.getMessage();

                    // Kiểm tra thuộc tính và gán lỗi vào đúng trường
                    if ("email".equals(propertyPath)) {
                        newTeacherBindingResult.rejectValue("user.email", "error.user.email", message);
                    } else if ("password".equals(propertyPath)) {
                        newTeacherBindingResult.rejectValue("user.password", "error.user.password", message);
                    }

                }
                return "/admin/teacher/create";
            }
        }

        String avatar = this.uploadService.handleSaveUpload(file, "teacher");

        User user = new User();
        user.setEmail(teacher.getUser().getEmail());
        user.setPassword(teacher.getUser().getPassword());
        user.setRole(this.userService.getRoleByName("TEACHER"));
        this.userService.handleSaveUser(user);

        teacher.setAvatar(avatar);
        teacher.setUser(user);
        this.teacherService.handleSaveTeacher(teacher);

        return "redirect:/admin/teacher";
    }

    @GetMapping("/admin/teacher/update/{id}")
    public String getUpdateTeacherPage(Model model, @PathVariable long id) {
        Teacher currentTeacher = this.teacherService.getTeacherById(id).get();
        model.addAttribute("newTeacher", currentTeacher);
        return "admin/teacher/update";
    }

    @PostMapping("/admin/teacher/update")
    public String updateTeacherPage(Model model,
            @ModelAttribute("newTeacher") Teacher teacher,
            @RequestParam("teacherAvatarFile") MultipartFile file) {

        Optional<Teacher> teacherOptional = this.teacherService.getTeacherById(teacher.getId());
        if (teacherOptional.isPresent()) {
            Teacher currentTeacher = teacherOptional.get();
            if (!file.isEmpty()) {
                String imageProduct = this.uploadService.handleSaveUpload(file, "teacher");
                currentTeacher.setAvatar(imageProduct);
            }

            currentTeacher.setFullName(teacher.getFullName());
            currentTeacher.setPhone(teacher.getPhone());
            currentTeacher.setAddress(teacher.getAddress());
            currentTeacher.setBirthDate(teacher.getBirthDate());
            currentTeacher.setGender(teacher.getGender());

            this.teacherService.handleSaveTeacher(currentTeacher);
        }

        return "redirect:/admin/teacher";
    }

    @GetMapping("/admin/teacher/delete/{id}")
    public String getDeleteTeacherPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newTeacher", new Teacher());
        return "admin/teacher/delete";
    }

    @PostMapping("/admin/teacher/delete")
    public String postDeleteTeacherPage(Model model, @ModelAttribute("newTeacher") Teacher teacher) {
        this.teacherService.deleteTeacherById(teacher.getId());
        return "redirect:/admin/teacher";
    }
}