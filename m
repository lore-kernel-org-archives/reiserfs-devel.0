From: evilninja <evilninja@gmx.net>
Subject: Re: Reiserfsck can't fix FS
Date: Wed, 19 Oct 2005 22:17:06 +0200
Message-ID: <4356A9C2.4010109@gmx.net>
References: <1129303303.3370.4.camel@desktop>     <200510142008.42253.vitaly@namesys.com>     <1129484435.16949.1.camel@desktop>    <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com> <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: lordvan@lordvan.com

Thomas Raschbacher schrieb:
> how would I best copy the filesystem? DD ?

dd, if that does not work then try dd_rescue:

http://www.garloff.de/kurt/linux/ddrescue/

Christian.
-- 
BOFH excuse #34:

(l)user error
