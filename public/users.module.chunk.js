webpackJsonp(["users.module"],{

/***/ "../../../../../src/app/users/index.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__user_model__ = __webpack_require__("../../../../../src/app/users/user.model.ts");
/* unused harmony reexport User */
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__users_service__ = __webpack_require__("../../../../../src/app/users/users.service.ts");
/* harmony reexport (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return __WEBPACK_IMPORTED_MODULE_1__users_service__["a"]; });


//# sourceMappingURL=index.js.map

/***/ }),

/***/ "../../../../../src/app/users/index/index.component.css":
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__("../../../../css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "", ""]);

// exports


/*** EXPORTS FROM exports-loader ***/
module.exports = module.exports.toString();

/***/ }),

/***/ "../../../../../src/app/users/index/index.component.html":
/***/ (function(module, exports) {

module.exports = "<div id=\"main-product\" class=\"col-md-12\">\n  <page-header\n    [title]=\"'user-management.title' | translate\"\n    [smallTitle]=\"'user-management.small-title' | translate\">\n\n  </page-header>\n\n  <div\n    *ngIf=\"showAlert\"\n    class=\"alert alert-block alert-success\">\n    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" (click)=\"showAlert=false\">\n      <i class=\"ace-icon fa fa-times\"></i>\n    </button>\n\n    <p><i class=\"ace-icon fa fa-check\"></i>{{ 'user-management.instruc1' | translate}}</p>\n    {{ 'Table.email' | translate }}: {{emailJustAdded}}<br>\n    {{ 'Table.password' | translate }}: {{passwordJustAdded}}\n    <p><strong>{{ 'user-management.instruc2' | translate}}</strong> {{ 'user-management.instruc3' | translate}}</p>\n  </div>\n\n  <div class=\"tableTools-container\">\n    <button type=\"button\" class=\"btn btn-primary create-product\" (click)=\"modal.open()\">{{ 'user-management.modal-title' | translate}}</button>\n  </div>\n  <div>\n\n\n    <table datatable [dtOptions]=\"dtOptions\" [dtTrigger]=\"dtTrigger\"\n          id=\"dynamic-table_wrapper\"\n          class=\"table table-striped table-bordered\n          table-hover dataTable no-footer\" cellspacing=\"0\" width=\"100%\">\n      <thead>\n        <tr>\n          <th><i class=\"ace-icon fa fa-user\"></i>{{ 'Table.user' | translate }}</th>\n          <th><i>@</i> {{ 'Table.email' | translate }}</th>\n          <th><i class=\"ace-icon fa fa-id-card-o\"></i> {{ 'Table.role' | translate }}</th>\n          <!-- <th>{{ 'Products.THead.DefaultImportedPrice' | translate }}</th> -->\n          <!-- <th>{{ 'Products.THead.DefaultSalePrice' | translate }}</th> -->\n          <th class=\"sorting_disabled\"></th>\n        </tr>\n      </thead>\n\n      <tbody>\n        <tr *ngFor=\"let user of users\">\n          <td>{{ user.name }}</td>\n          <td>{{ user.email }}</td>\n          <td>\n            <ng-container *ngIf=\"user.role==='manager'\">\n              <span class=\"label label-info arrowed-in arrowed-in-right\">\n                {{ 'user-management.manager' | translate }}\n              </span>\n            </ng-container>\n            <ng-container *ngIf=\"user.role!=='manager'\">\n              <span class=\"label label-yellow arrowed-in\">\n                {{ 'user-management.staff' | translate }}\n              </span>\n            </ng-container>\n          </td>\n\n          <td>\n            <button class=\"btn btn-xs btn-info\" tooltip=\"{{ 'tooltip.edit' | translate }}\" (click)=\"selectUpdate(user.id)\">\n              <i class=\"ace-icon fa fa-pencil bigger-120\"></i>\n            </button>\n            <button *ngIf=\"user.active==true\"class=\"btn btn-xs btn-danger\" tooltip=\"{{ 'tooltip.delete' | translate }}\" (click)=\"openModalRemoveAccount(user.id)\">\n              <i class=\"ace-icon fa fa-trash-o bigger-120\"></i>\n            </button>\n\n            <button *ngIf=\"user.active==false\" class=\"btn btn-xs btn-warning\" tooltip=\"{{ 'tooltip.reactive' | translate }}\" (click)=\"reactiveAccount(user.id)\">\n              <i class=\"ace-icon fa fa-undo bigger-120\"></i>\n            </button>\n          </td>\n        </tr>\n      </tbody>\n    </table>\n  </div>\n</div>\n\n<modal #modal>\n  <modal-header [show-close]=\"true\">\n    <h4 class=\"modal-title\">{{ 'user-management.modal-update-title' | translate}}</h4>\n  </modal-header>\n  <modal-body>\n    <app-input-field [attribute]=\"'Table.name' | translate\" [control]=\"form.get('name')\">\n    </app-input-field>\n\n    <app-input-field [attribute]=\"'Table.email' | translate\" [control]=\"form.get('email')\">\n    </app-input-field>\n\n    <app-input-field [attribute]=\"'Table.password' | translate\" [control]=\"form.get('password')\" [type]=\"'password'\">\n    </app-input-field>\n\n    <app-input-field [attribute]=\"'Table.passwordConfirmation' | translate\" [control]=\"form.get('password_confirmation')\" [type]=\"'password'\">\n    </app-input-field>\n    <app-error-label [control]=\"form\"></app-error-label>\n\n    <div class=\"control-group\">\n      <label for=\"\">{{ 'Table.role' | translate }}</label>\n      <!-- choose manager -->\n      <div class=\"radio\">\n        <label>\n          <input type=\"radio\" class=\"ace\" name=\"form-field-radio\" [value]=\"true\" [(ngModel)]=\"role\">\n          <span class=\"lbl\">\n            {{ 'user-management.manager' | translate }}\n          </span>\n        </label>\n      </div>\n      <!-- Choose staff -->\n      <div class=\"radio\">\n        <label>\n          <input type=\"radio\" class=\"ace\" name=\"form-field-radio\" [value]=\"false\" [(ngModel)]=\"role\">\n          <span class=\"lbl\">\n             {{ 'user-management.staff' | translate }}\n          </span>\n        </label>\n      </div>\n\n    </div>\n\n  </modal-body>\n  <modal-footer>\n    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" (click)=\"modal.dismiss()\">{{ 'Products.Modal.Cancel' | translate }}</button>\n    <button id=\"btn-create-user\" class=\"btn btn-primary add-product\" (click)=\"addUser(form.value)\" [disabled]=\"form.invalid\">{{ 'button.create' | translate }}</button>\n  </modal-footer>\n</modal>\n\n<modal #modalUpdate>\n  <modal-header [show-close]=\"true\">\n    <h4 class=\"modal-title\">{{ 'user-management.modal-update-title' | translate}}</h4>\n  </modal-header>\n  <modal-body>\n    <app-input-field [attribute]=\"'Table.name' | translate\" [control]=\"updateForm.get('name')\">\n    </app-input-field>\n\n    <div class=\"control-group\">\n      <label for=\"\">{{ 'Table.role' | translate }}</label>\n      <!-- choose manager -->\n      <div class=\"radio\">\n        <label>\n          <input type=\"radio\" class=\"ace\" name=\"form-field-radio-update-user\" [value]=\"true\" [(ngModel)]=\"currentRole\">\n          <span class=\"lbl\">\n            {{ 'user-management.manager' | translate }}\n          </span>\n        </label>\n      </div>\n      <!-- Choose staff -->\n      <div class=\"radio\">\n        <label>\n          <input type=\"radio\" class=\"ace\" name=\"form-field-radio-update-user\" [value]=\"false\" [(ngModel)]=\"currentRole\">\n          <span class=\"lbl\">\n            {{ 'user-management.staff' | translate }}\n          </span>\n        </label>\n      </div>\n\n    </div>\n\n  </modal-body>\n  <modal-footer>\n    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" (click)=\"modal.dismiss()\">{{ 'Products.Modal.Cancel' | translate }}</button>\n    <button class=\"btn btn-primary add-product\" (click)=\"updateUser(updateForm.value)\" [disabled]=\"updateForm.invalid\">{{ 'modal.update-btn' | translate }}</button>\n  </modal-footer>\n</modal>\n\n<modal #modalConfirm>\n  <modal-header [show-close]=\"true\">\n    <h4 class=\"modal-title\">{{ 'modal.confirm_remove_account' | translate }}</h4>\n  </modal-header>\n  <modal-footer>\n    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" (click)=\"modal.dismiss()\">{{ 'button.cancel' | translate }}</button>\n    <button type=\"button\" class=\"btn btn-primary\" (click)=\"removeAccount()\">{{ 'button.delete' | translate  }}</button>\n  </modal-footer>\n</modal>\n\n\n"

/***/ }),

/***/ "../../../../../src/app/users/index/index.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return IndexComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("../../../core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_forms__ = __webpack_require__("../../../forms/@angular/forms.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__shared_toastr_service__ = __webpack_require__("../../../../../src/app/shared/toastr.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__ = __webpack_require__("../../../../ng2-bs3-modal/ng2-bs3-modal.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__shared_get_url_lang__ = __webpack_require__("../../../../../src/app/shared/get_url_lang.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5_rxjs_Subject__ = __webpack_require__("../../../../rxjs/Subject.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5_rxjs_Subject___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_5_rxjs_Subject__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map__ = __webpack_require__("../../../../rxjs/add/operator/map.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7____ = __webpack_require__("../../../../../src/app/users/index.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8_lodash__ = __webpack_require__("../../../../lodash/lodash.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8_lodash___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_8_lodash__);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};









var IndexComponent = (function () {
    function IndexComponent(usersService, fb, toastSvc) {
        this.usersService = usersService;
        this.fb = fb;
        this.toastSvc = toastSvc;
        this.dtOptions = {};
        this.dtTrigger = new __WEBPACK_IMPORTED_MODULE_5_rxjs_Subject__["Subject"]();
        this.users = [];
        this.role = false;
        this.currentRole = false;
        this.showAlert = false;
        this.emailJustAdded = "";
        this.passwordJustAdded = "";
    }
    IndexComponent.prototype.ngOnInit = function () {
        this.dtOptions = {
            pagingType: "full_numbers",
            language: {
                url: Object(__WEBPACK_IMPORTED_MODULE_4__shared_get_url_lang__["a" /* getLangUrl */])()
            }
        };
        this.getUsers();
        this.buildForm();
    };
    IndexComponent.prototype.getUsers = function () {
        var _this = this;
        this.getUsers$ = this.usersService.getUsers();
        this.getUsers$.subscribe(function (users) {
            _this.users = users;
            _this.dtTrigger.next();
        });
    };
    IndexComponent.prototype.addUser = function (value) {
        var _this = this;
        console.log(this.role);
        var signUpData = {
            email: value.email,
            name: value.name,
            password: value.password,
            password_confirmation: value.password_confirmation,
            role: this.role ? "manager" : "staff"
        };
        this.usersService.addUser(signUpData).subscribe(function (user) {
            _this.users.push(user);
            _this.modal.close();
            _this.emailJustAdded = value.email;
            _this.passwordJustAdded = value.password;
            _this.showAlert = true;
            _this.form.reset();
        });
    };
    IndexComponent.prototype.buildForm = function () {
        this.form = this.fb.group({
            email: [
                "",
                __WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].compose([__WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].email]),
                this.validateEmailNotTaken.bind(this)
            ],
            name: ["", __WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].required],
            password: [
                "",
                __WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].compose([__WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].required, __WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].minLength(8)])
            ],
            password_confirmation: ["", __WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].required],
            role: [false]
        }, { validator: this.passwordConfirming });
        this.updateForm = this.fb.group({
            name: ["", __WEBPACK_IMPORTED_MODULE_1__angular_forms__["Validators"].required]
        });
    };
    IndexComponent.prototype.selectUpdate = function (id) {
        var userSelected = this.users.find(function (user) { return user.id === id; });
        this.updateForm.setValue({
            name: userSelected.name
        });
        this.selectedId = userSelected.id;
        this.currentRole = userSelected.role === "manager";
        this.modalUpdate.open();
    };
    IndexComponent.prototype.updateUser = function (value) {
        var _this = this;
        var data = {
            id: this.selectedId,
            name: value.name,
            role: this.currentRole ? "manager" : "staff"
        };
        this.usersService.updateUser(data).subscribe(function (data) {
            __WEBPACK_IMPORTED_MODULE_8_lodash__["assign"](_this.users.find(function (user) { return user.id === data.id; }), data);
            _this.modalUpdate.close();
        });
    };
    IndexComponent.prototype.openModalRemoveAccount = function (user_id) {
        this.remove_user_id = user_id;
        this.modalConfirm.open();
    };
    IndexComponent.prototype.removeAccount = function () {
        var _this = this;
        this.modalConfirm.close();
        this.usersService.removeUser(this.remove_user_id).subscribe(function () {
            _this.users.find(function (user) { return user.id === _this.remove_user_id; }).active = false;
            _this.toastSvc.SetMessageSuccess("Success");
        });
    };
    IndexComponent.prototype.reactiveAccount = function (id) {
        var _this = this;
        this.usersService.removeUser(id).subscribe(function () {
            _this.users.find(function (user) { return user.id === id; }).active = true;
            _this.toastSvc.SetMessageSuccess("Success");
        });
    };
    // Validate form
    IndexComponent.prototype.passwordConfirming = function (c) {
        if (c.get("password").value !== c.get("password_confirmation").value) {
            return { passwordShouldBeMatched: true };
        }
        return null;
    };
    IndexComponent.prototype.validateEmailNotTaken = function (control) {
        return this.getUsers$
            .map(function (users) { return users.filter(function (user) { return user.email === control.value; }); })
            .map(function (users) { return !users.length; })
            .map(function (res) {
            return res ? null : { emailTaken: true };
        });
    };
    return IndexComponent;
}());
__decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["ViewChild"])("modal"),
    __metadata("design:type", typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__["ModalComponent"] !== "undefined" && __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__["ModalComponent"]) === "function" && _a || Object)
], IndexComponent.prototype, "modal", void 0);
__decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["ViewChild"])("modalUpdate"),
    __metadata("design:type", typeof (_b = typeof __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__["ModalComponent"] !== "undefined" && __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__["ModalComponent"]) === "function" && _b || Object)
], IndexComponent.prototype, "modalUpdate", void 0);
__decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["ViewChild"])("modalConfirm"),
    __metadata("design:type", typeof (_c = typeof __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__["ModalComponent"] !== "undefined" && __WEBPACK_IMPORTED_MODULE_3_ng2_bs3_modal_ng2_bs3_modal__["ModalComponent"]) === "function" && _c || Object)
], IndexComponent.prototype, "modalConfirm", void 0);
IndexComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: "users-index",
        template: __webpack_require__("../../../../../src/app/users/index/index.component.html"),
        styles: [__webpack_require__("../../../../../src/app/users/index/index.component.css")]
    }),
    __metadata("design:paramtypes", [typeof (_d = typeof __WEBPACK_IMPORTED_MODULE_7____["a" /* UsersService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_7____["a" /* UsersService */]) === "function" && _d || Object, typeof (_e = typeof __WEBPACK_IMPORTED_MODULE_1__angular_forms__["FormBuilder"] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_forms__["FormBuilder"]) === "function" && _e || Object, typeof (_f = typeof __WEBPACK_IMPORTED_MODULE_2__shared_toastr_service__["a" /* ToastrService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__shared_toastr_service__["a" /* ToastrService */]) === "function" && _f || Object])
], IndexComponent);

var _a, _b, _c, _d, _e, _f;
//# sourceMappingURL=index.component.js.map

/***/ }),

/***/ "../../../../../src/app/users/user.model.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* unused harmony export User */
var User = (function () {
    function User(id, email, name, role) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.role = role;
    }
    User.prototype.isManager = function () {
        return this.role === 'manager';
    };
    return User;
}());

//# sourceMappingURL=user.model.js.map

/***/ }),

/***/ "../../../../../src/app/users/users.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "UsersModule", function() { return UsersModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("../../../core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__("../../../router/@angular/router.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_forms__ = __webpack_require__("../../../forms/@angular/forms.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_common__ = __webpack_require__("../../../common/@angular/common.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__index_index_component__ = __webpack_require__("../../../../../src/app/users/index/index.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__users_routing__ = __webpack_require__("../../../../../src/app/users/users.routing.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__shared_shared_module__ = __webpack_require__("../../../../../src/app/shared/shared.module.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};







var UsersModule = (function () {
    function UsersModule() {
    }
    return UsersModule;
}());
UsersModule = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["NgModule"])({
        imports: [
            __WEBPACK_IMPORTED_MODULE_3__angular_common__["CommonModule"],
            __WEBPACK_IMPORTED_MODULE_6__shared_shared_module__["a" /* SharedModule */],
            __WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* RouterModule */].forChild(__WEBPACK_IMPORTED_MODULE_5__users_routing__["a" /* UsersRoutes */]),
            __WEBPACK_IMPORTED_MODULE_2__angular_forms__["ReactiveFormsModule"],
            __WEBPACK_IMPORTED_MODULE_2__angular_forms__["FormsModule"],
        ],
        declarations: [__WEBPACK_IMPORTED_MODULE_4__index_index_component__["a" /* IndexComponent */]]
    })
], UsersModule);

//# sourceMappingURL=users.module.js.map

/***/ }),

/***/ "../../../../../src/app/users/users.routing.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return UsersRoutes; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__index_index_component__ = __webpack_require__("../../../../../src/app/users/index/index.component.ts");

var UsersRoutes = [
    {
        path: '',
        component: __WEBPACK_IMPORTED_MODULE_0__index_index_component__["a" /* IndexComponent */]
    }
];
//# sourceMappingURL=users.routing.js.map

/***/ })

});
//# sourceMappingURL=users.module.chunk.js.map