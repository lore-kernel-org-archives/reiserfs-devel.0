From: Ming Zhang <mingz@ele.uri.edu>
Subject: tail option limit
Date: Mon, 29 Aug 2005 10:49:14 -0400
Message-ID: <1125326954.5544.67.camel@localhost.localdomain>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

Hi,

I saw from document that small files will be packed into meta-data thus
save an extra data block read.

how small is the boundary? i guess it has related with file block size.

assume it is 4KB by default.

so will

< 4KB be packed?

= 4KB be packed?

> 4KB be packed? (it is NO here i bet.)

Thanks!

Ming

