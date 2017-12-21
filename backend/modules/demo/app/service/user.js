'use strict';

const Service = require('egg').Service;

class UserService extends Service {
  async haha() {
    return await this.ctx.model.User.find({});
  }

  async save(params) {
    const user = new this.ctx.model.User();
    user.userName = params.userName;
    user.password = params.password;

    return await user.save();
  }
}

module.exports = UserService;
