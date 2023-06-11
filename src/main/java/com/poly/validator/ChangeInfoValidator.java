package com.poly.validator;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.entity.User;
import com.poly.model.ChangeInfoModel;

@Component
public class ChangeInfoValidator implements Validator{
	private EmailValidator emailValidator = EmailValidator.getInstance();

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == ChangeInfoModel.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ChangeInfoModel entity = (ChangeInfoModel) target;

		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "NotNull.user.id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", "NotNull.user.fullname");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotBlank.user.email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotBlank.user.phone");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "NotNull.user.gender");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthday", "NotNull.user.birthday");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotBlank.user.address");
		
		if(!errors.hasFieldErrors("email")) {
			if(!this.emailValidator.isValid(entity.getEmail())) {
				errors.rejectValue("email", "Email.student.email");
			}
		}
		
		
	}
	
}
