From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: fsck.reiser4 problem
Date: Tue, 31 Aug 2004 11:43:49 +0200
Message-ID: <41344855.7070706@dermichi.com>
References: <20040831012446.631CB15E2E@mail03.powweb.com> <41343C53.3080507@dermichi.com> <41344719.7040700@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41344719.7040700@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Vince <fuzzy77@free.fr>

> 
> "rm lost*" should work...
> 
nope:
criminal lost+found # ls
lost_name_2a:131323334353637:1000bÿ¿`oÿ·êÓã·??
lost_name_2a:131323334353637:1000cÿ¿`oÿ·êÓã·??
lost_name_2a:131323334353637:1000dÿ¿`oÿ·êÓã·??
lost_name_2a:131323334353637:1000fÿ¿`oÿ·êÓã·??
lost_name_2a:142657765726275:10004ÿ¿`oÿ·êÓã·??
lost_name_2a:142657765726275:10011ÿ¿`oÿ·êÓã·??
lost_name_2a:14772617068696b:10012ÿ¿`oÿ·êÓã·??
lost_name_2a:15769655465616d:10013ÿ¿`oÿ·êÓã·??
criminal lost+found # ls -l
ls: lost_name_2a:131323334353637:1000bÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:131323334353637:1000cÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:131323334353637:1000dÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:131323334353637:1000fÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:14772617068696b:10012ÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:142657765726275:10004ÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:142657765726275:10011ÿ¿`oÿ·êÓã·        : No such file 
or directory
ls: lost_name_2a:15769655465616d:10013ÿ¿`oÿ·êÓã·        : No such file 
or directory
total 0
criminal lost+found # rm lost*
rm: cannot remove `lost_name_2a:131323334353637:1000bÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:131323334353637:1000cÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:131323334353637:1000dÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:131323334353637:1000fÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:142657765726275:10004ÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:142657765726275:10011ÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:14772617068696b:10012ÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
rm: cannot remove `lost_name_2a:15769655465616d:10013ÿ¿`oÿ·êÓã·\t\224': 
No such file or directory
criminal lost+found # ls
lost_name_2a:131323334353637:1000bÿ¿`oÿ·êÓã·??
lost_name_2a:131323334353637:1000cÿ¿`oÿ·êÓã·??
lost_name_2a:131323334353637:1000dÿ¿`oÿ·êÓã·??
lost_name_2a:131323334353637:1000fÿ¿`oÿ·êÓã·??
lost_name_2a:142657765726275:10004ÿ¿`oÿ·êÓã·??
lost_name_2a:142657765726275:10011ÿ¿`oÿ·êÓã·??
lost_name_2a:14772617068696b:10012ÿ¿`oÿ·êÓã·??
lost_name_2a:15769655465616d:10013ÿ¿`oÿ·êÓã·??

still there :)
i guess removing lost+found would work, but how are these strange 
filenames created in the first place?

Michael
