From: Joe Feise <jfeise@feise.com>
Subject: Re: Read errors from r/o-mounted reiser4
Date: Wed, 18 Jan 2006 08:33:15 -0800
Message-ID: <43CE6DCB.7090506@feise.com>
References: <43B221E3.3020201@feise.com>	 <1135823501.6469.63.camel@tribesman.namesys.com>	 <43B8EC8E.3020500@feise.com>	 <1137542900.6375.85.camel@tribesman.namesys.com> <43CD21B9.60801@feise.com> <1137632415.6573.4.camel@tribesman.namesys.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1137632415.6573.4.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir V. Saveliev wrote on 01/18/06 17:00:

> Hello
> 
> On Tue, 2006-01-17 at 08:56 -0800, Joe Feise wrote:
>> unfortunately, the patch did not help. I still get the same errors:
>>
> sorry, please try new version of patch. (you have to patch -R the old
> one).


Vladimir,

thanks. This patch works.

$: mount -o ro,remount /usr
$: make xconfig
  CHECK   qt
  HOSTCC  scripts/kconfig/kconfig_load.o
/usr/lib/qt/bin/moc -i scripts/kconfig/qconf.h -o scripts/kconfig/qconf.moc
  HOSTCXX scripts/kconfig/qconf.o
  HOSTLD  scripts/kconfig/qconf
...

-Joe
