import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const organizationName: String = 'WeAreFrank';
const projectName: String = '{{ cookiecutter.instance_name_lc }}';

const config: Config = {
  title: '{{ cookiecutter.instance_name }}',
  tagline: '',
  favicon: 'img/waf-logo-favicon-16x16.png',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: `${organizationName}`, // Usually your GitHub org/user name.
  projectName: `${projectName}`, // Usually your repo name.

  // Set the production url of your site here
  url: `https://${organizationName}.github.io`,
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: `/${projectName}/`,


  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            `https://github.com/${organizationName}/${projectName}/tree/main/docusaurus/`,
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    // Replace with your project's social card
    image: 'img/waf-logo-192x192.png',
    navbar: {
      title: '{{ cookiecutter.instance_name }}',
      logo: {
        alt: 'WeAreFrank',
        src: 'img/waf-logo-192x192.png',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'docsSidebar',
          position: 'left',
          label: 'Docs',
        },
        {
          href: `https://github.com/${organizationName}/${projectName}`,
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      links: [
        {
          title: `${organizationName}`,
          items: [
            {
              label: 'WeAreFrank',
              href: 'https://wearefrank.nl',
            },
            {
              label: 'Frank!Framework',
              href: 'https://frankframework.org/',
            },
            {
              label: 'Contact',
              href: 'https://wearefrank.nl/contact',
            },
          ],
        },
        {
          title: 'Resources',
          items: [
            {
              label: 'Frank!Framework GitHub',
              href: 'https://github.com/frankframework/frankframework',
            },
            {
              label: 'Frank!Manual',
              href: 'https://frank-manual.readthedocs.io/en/latest/',
            },
            {
              label: 'Frank!Doc',
              href: 'https://frankdoc.frankframework.org/#/All',
            },
            {
              label: 'WeAreFrank!TV',
              href: 'https://wearefrank.nl/wearefrank-tv',
            },
            {
              label: 'Frank!Academy',
              href: 'https://wearefrank.nl/frank-academy',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} ${organizationName}. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
