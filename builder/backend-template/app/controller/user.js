'use strict';

const Controller = require('egg').Controller;

class UserController extends Controller {
  async index() {
    this.ctx.body = await this.ctx.service.user.haha();
  }

  async save() {
    this.ctx.body = await this.ctx.service.user.save({
      userName: 'xsx',
      password: 24,
    });
  }
}

module.exports = UserController;
