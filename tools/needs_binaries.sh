#!/bin/bash
if [ ! -d ../packages ]; then
  echo 'Unable to locate packages directory.'
  exit 1
fi
cd ../packages
arch=$(uname -m)
exclusions='android_studio.rb antlr4.rb asciinema.rb autosetup.rb broadway.rb cabal.rb checkinstall.rb codium.rb composer.rb cowsay.rb'
exclusions+=' crew_profile.rb cros_resize.rb dart.rb depot_tools.rb docx2txt.rb dr.rb elixir.rb far.rb firefox.rb fortune.rb fortunes.rb'
exclusions+=' fpc.rb freedos.rb gcc_tools.rb ghc.rb gittools.rb google_cloud_sdk.rb gradle.rb hugo.rb hunspell.rb idea.rb julia.rb komodo.rb'
exclusions+=' kr.rb ld_default.rb leiningen.rb libtinfo.rb lsb_release.rb mysqltuner.rb nconvert.rb neofetch.rb netbeans.rb ngrok.rb nodebrew.rb'
exclusions+=' nvm.rb oc.rb packer.rb perl_gcstring_linebreak.rb perl_io_socket_ssl.rb perl_locale_gettext.rb perl_locale_messages.rb'
exclusions+=' perl_module_build.rb perl_read_key.rb perl_sgmls.rb perl_term_ansicolor.rb perl_text_charwidth.rb perl_text_unidecode.rb'
exclusions+=' perl_text_wrapi18n.rb perl_time_hires.rb perl_unicode_eastasianwidth.rb perl_xml_parser.rb perl_xml_sax_parserfactory.rb'
exclusions+=' perl_xml_simple.rb pipes_sh.rb pipesx_sh.rb platformsh.rb pngcheck.rb pycharm.rb qtcreator.rb sl.rb spark.rb stack.rb'
exclusions+=' sublime_merge.rb sublime_text.rb terminus.rb thefuck.rb tinycore.rb tkdiff.rb txt2regex.rb uwsgi.rb v2ray.rb wp_cli.rb'
exclusions+=' xdg_base.rb yarn.rb'
if [[ "${arch}" == 'aarch64' || "${arch}" == 'armv7l' ]]; then
  exclusions+=' atom.rb az.rb cf.rb clisp.rb dropbox.rb fakeroot_ng.rb freebasic.rb miniconda3.rb misctools.rb oci.rb opera.rb skype.rb'
  exclusions+=' weston.rb wing.rb wkhtmltox.rb xorg_intel_driver.rb xorg_vmmouse_driver.rb'
fi
if [[ "${arch}" == 'i686' ]]; then
  exclusions+=' aqemu.rb atom.rb codelite.rb cras.rb dia.rb exa.rb fakeroot_ng.rb gimp.rb gtk_engines_adwaita.rb imagemagick6.rb'
  exclusions+=' imagemagick7.rb libvncserver.rb neovim.rb opera.rb skype.rb tcpflow.rb wing.rb'
fi
packages=$(grep -L "${arch}:" *.rb)
for p in ${packages}; do
  include=1
  for e in ${exclusions}; do
    if [ "${e}" == "${p}" ]; then
      include=
      break
    fi
  done
  if [[ -n "${include}" ]]; then
    grep -L is_fake ${p}
  fi
done
