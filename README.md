# README

## development

Requires ruby 2.4.0 and git cli tools.

```
git clone https://andygauge.github.com/oof-impersonation
gem install bundler
bundle
rake db:migrate
rails s
```

## production

Production uses upstart to maintain server.  Server automatically starts on boot
If server is not running:

```
sudo start oof-impersonation
```

Upstart executes as root, so ruby is installed directly, using package manager.
Administrator account owns files within /home/administrator/oof-impersonation.
Production codebase exists in production branch (exists only locally).
Changes to the codebase can be applied by using

```
cd ~\oof-impersonation
git pull origin master
sudo rails assets:precompile
sudo restart oof-impersonation
```

## CSV import

Create a list of mailboxes using Exchange Shell.

```
Get-Mailbox -ResultSize Unlimited | Select Name, PrimarySMTPAddress | Export-CSV -Path "c:\mailboxes.csv"
```

Import the list of mailboxes

```
rake csv:import[mailboxes.csv]
```
