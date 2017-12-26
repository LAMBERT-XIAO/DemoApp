'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx, app } = this;
    // set
    await app.redis.set('foo', 1234567);
    // get
    ctx.body = await app.redis.get('foo');
  }
}

module.exports = HomeController;
