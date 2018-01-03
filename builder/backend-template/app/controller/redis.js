'use strict';

const Controller = require('egg').Controller;

class RedisController extends Controller {
  async index() {
    const { ctx, app } = this;
    await app.redis.set('foo', 1234567);
    ctx.body = await app.redis.get('foo');
  }
}

module.exports = RedisController;
