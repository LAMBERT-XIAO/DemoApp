'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);

  /**
   * User Routers
   */
  router.get('/users', controller.user.index);
  router.get('/users/save', controller.user.save);
};
