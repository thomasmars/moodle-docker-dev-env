import { Selector } from 'testcafe';
import * as fs from 'fs';

const basePath = 'http://localhost';
const loginPath = `${basePath}/login/index.php`;
const pluginsPath = `${basePath}/admin/plugins.php`;

const user = 'admin';
const pass = 'Admin';


fixture('Reinstall plugin')
  .page(loginPath);

test('Installing ma old libs', async t => {

  // Enter login data
  await t.typeText('#username', user)
    .typeText('#password', pass)
    .click('#loginbtn');

  await t.navigateTo(pluginsPath);

  // Uninstall plugin
  await t.click('.name-mod_hvp .uninstall');

  // Agree to deleting plugin
  await t.click('#modal-footer .btn.btn-primary');
});
