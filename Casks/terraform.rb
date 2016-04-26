cask 'terraform' do
  version '0.6.15'
  sha256 '9cb305ac00b85e2575da3c71504f3fdd3f7ef61f35457af999c7b88802143311'

  # hashicorp.com/terraform was verified as official when first introduced to the cask
  url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_darwin_amd64.zip"
  appcast 'https://github.com/hashicorp/terraform/releases.atom',
          checkpoint: 'b8c147a103231db917b062d9b5bff96151e3b50aa72d54ae030af296bd2b7060'
  name 'Terraform'
  homepage 'https://www.terraform.io/'
  license :mpl

  binary 'terraform'
  binary 'terraform-provider-atlas'
  binary 'terraform-provider-aws'
  binary 'terraform-provider-azure'
  binary 'terraform-provider-azurerm'
  binary 'terraform-provider-chef'
  binary 'terraform-provider-clc'
  binary 'terraform-provider-cloudflare'
  binary 'terraform-provider-cloudstack'
  binary 'terraform-provider-consul'
  binary 'terraform-provider-datadog'
  binary 'terraform-provider-digitalocean'
  binary 'terraform-provider-dme'
  binary 'terraform-provider-dnsimple'
  binary 'terraform-provider-docker'
  binary 'terraform-provider-dyn'
  binary 'terraform-provider-github'
  binary 'terraform-provider-google'
  binary 'terraform-provider-heroku'
  binary 'terraform-provider-influxdb'
  binary 'terraform-provider-mailgun'
  binary 'terraform-provider-mysql'
  binary 'terraform-provider-null'
  binary 'terraform-provider-openstack'
  binary 'terraform-provider-packet'
  binary 'terraform-provider-postgresql'
  binary 'terraform-provider-powerdns'
  binary 'terraform-provider-rundeck'
  binary 'terraform-provider-statuscake'
  binary 'terraform-provider-template'
  binary 'terraform-provider-terraform'
  binary 'terraform-provider-tls'
  binary 'terraform-provider-triton'
  binary 'terraform-provider-ultradns'
  binary 'terraform-provider-vcd'
  binary 'terraform-provider-vsphere'
  binary 'terraform-provisioner-chef'
  binary 'terraform-provisioner-file'
  binary 'terraform-provisioner-local-exec'
  binary 'terraform-provisioner-remote-exec'
end
