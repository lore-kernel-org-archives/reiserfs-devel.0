From: frbiscani@jumpy.it
Subject: reiser4 - Non-removable files in lost+found
Date: Thu, 14 Oct 2004 19:08:22 +0200
Message-ID: <40FC740900079C5C@mail13.jumpyint.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22065-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

After a reiser4 crash I had to run fsck with the --build-fs option. Some

garbage was collected in /lost+found. I deleted it for the most part, but=


there are "files" I can't remove. 

For example:

rm /lost+found/lost_name_*

gives:

rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e2e2r?\t

v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
file 
or directory
rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e2f3r?\t

v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
file 
or directory
rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e306r?\t

v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
file 
or directory
rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e310r?\t

v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
file 
or directory
[...]

and so on. I've tried also "rm -d" and unlink, but with no luck. Is there=

a 
way to clean up (apart from mkfs :))?

Thanks,

francesco


________________________________________
Crea la tshirt con il tuo nick! http://www.mediasetshop.it/JumpyChat/


