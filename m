From: Piotr Neuman <sikkh@wp.pl>
Subject: [patch] "readdir" pseudo file security
Date: Wed, 10 Nov 2004 23:04:34 +0100
Message-ID: <200411102304.34929.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>

Hello

Reiser4 with pseudo files enabled has a security issue. You can read contents 
of any directory if you have "+x" access to it, for example if "a" is a 
directory:

cat a/metas/readdir

will list directory contents even if you don't have read permissions to "a". 
This patch adds setup_mode() method to reiser4 pseudo_plugin structure which 
allows for more granular setting of permissions depending on given  "host" 
object permissions. Patch is available at:

http://kem.p.lodz.pl/~peter/reiser4/reiser4_secure_readdir.patch

Regards

Piotr Neuman

ps. thanks go (as usually ;) to Nikita Danilov...
