From: Ketil Froyn <reiserfs@ketil.froyn.name>
Subject: reiserfs on Redhat Enterprise Linux
Date: Tue, 05 Oct 2004 15:51:32 +0100
Message-ID: <1096987891.4297.383.camel@ketil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I am investigating a migration of a system relying on reiserfs to Redhat
Enterprise Linux 3. As I understand it, reiserfs is unsupported in
RHEL3, but is available anyway in a kernel-unsupported package or
something like that. However, it seems the reiserfs-utils package is not
available.

Which version of reiserfsprogs should I use to make sure I have one that
works for me? For instance, should I always go for the latest one (which
is 3.6.18 today), or do I need to match reiserfs-utils version to kernel
version in some fashion?

Thanks,

Ketil Froyn
ketil@froyn.name
http://ketil.froyn.name/

