From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: A file-based interface for mount
Date: Wed, 09 Jul 2003 12:56:49 -0500
Message-ID: <3F0C5761.2000204@mrs.umn.edu>
References: <3F078EF1.6090908@mrs.umn.edu>	<3F0C161B.6030707@namesys.com>	<16140.7137.369855.682433@laputa.namesys.com>	<3F0C4A63.8080808@mrs.umn.edu> <16140.19497.437113.157626@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16140.19497.437113.157626@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> [See] http://www.namesys.com/v4/pseudo.html

Very awesome :)

>/mnt/1# # obtaining directory listing without getdents(2)
>/mnt/1# cat ./..readdir
>.
>..
>a
>b
>emacs
>ls
>foo

What happens if a filename has a newline char in it?


