From: Pierre Abbat <phma@webjockey.net>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sat, 15 Mar 2003 20:13:46 -0500
Message-ID: <200303152013.46523.phma@webjockey.net>
References: <200303141942.00679.phma@webjockey.net> <200303151917.12807.phma@webjockey.net> <3E73C6A5.3070201@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E73C6A5.3070201@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

On Saturday 15 March 2003 19:34, Manuel Krause wrote:
> You'll need to process
>
>   make LDFLAGS='-static'
>
> or have this LDFLAGS set somewhere in the Makefile what I can't tell
> anything more about. Maybe Oleg & Company can if that command doesn't work.

Did that and had to scp it because the programs were too big for a floppy. It 
said:

reiserfs_open_journal: journal parameters from super block does not match to 
journal parameters from journal.

As I can mount /var, what's wrong? Does reiserfsck 3.6 not work on a 3.5 
filesystem?

phma

-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
