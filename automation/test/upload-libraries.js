import { Selector } from 'testcafe';
import * as fs from 'fs';

const basePath = 'http://localhost';
const loginPath = `${basePath}/login/index.php`;
const contentPath = `${basePath}/course/modedit.php?add=hvp&type=&course=2&section=0&return=0&sr=0`;
const user = 'admin';
const pass = 'Admin';

const titleSelector = '#id_name';
const submitSelector = '#id_submitbutton';

fixture('Install libraries')
  .page(`${loginPath}`);

const editorForm = Selector('.h5peditor-form');

const installContentType = async (t, fileName) => {
  // Add h5p content page
  await t.navigateTo(`${contentPath}`)
    .switchToIframe('.h5p-editor-iframe');

  await t.wait(1000);

  // Open hub client
  const hubPanel = await Selector('.icon-hub-icon');
  await t.expect(hubPanel).ok('Hub is showing up')
    .click(hubPanel);

  // Enter upload section
  const uploadSection = await Selector('#tab-upload');
  await t.click(uploadSection);

  const fileInput = await Selector('.input-wrapper input[type="file"]');
  await t.setFilesToUpload(fileInput, `../example-content/${fileName}`);

  const useButton = await Selector('.use-button');
  await t.click(useButton);

  // Wait for it to upload
  await editorForm();

  // switch to main window and save
  await t.switchToMainWindow();
  const titleInput = await Selector(titleSelector);
  await t.typeText(titleInput, fileName.split('.h5p')[0]);

  const submitButton = await Selector(submitSelector);
  await t.click(submitButton);
};

test('Installing ma old libs', async t => {

  // Enter login data
  await t.typeText('#username', user)
    .typeText('#password', pass)
    .click('#loginbtn');

  // await installContentType(t, 'accordion-6-7138.h5p');

  const files = fs.readdirSync('./example-content');
  for (let file of files) {
    console.log("what is file ?", file);
    const fileStat = fs.statSync(`./example-content/${file}`);
    console.log("is it a file ?", fileStat.isFile());
    if (fileStat.isFile()) {
      console.log("install", file);
      await installContentType(t, file);
    }
  }
});
