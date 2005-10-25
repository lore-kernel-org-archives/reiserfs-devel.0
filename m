From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: kernel dumps error messages  after heavy use and repeated mount
 unmount sequences
Date: Tue, 25 Oct 2005 18:40:51 +0400
Message-ID: <435E43F3.8010900@namesys.com>
References: <000e01c5d94d$75752d90$7ac44d0a@persistent.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000e01c5d94d$75752d90$7ac44d0a@persistent.co.in>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Abhijeet Anant Sane <abhijeet_sane@persistent.co.in>
Cc: reiserfs-list@namesys.com

Hello

Abhijeet Anant Sane wrote:
> ReiserFS 4.0 dumping a error message.
> 
> 
> ------------[ cut here ]------------
> kernel BUG at fs/reiser4/debug.c:141!
> invalid operand: 0000 [#6]
> Modules linked in: reiser4
> CPU:    0
> EIP:    0060:[<f8b972f7>]    Not tainted VLI
> EFLAGS: 00010202   (2.6.12)
> EIP is at reiser4_do_panic+0x2f7/0x320 [reiser4]

> 
> 
> Please tell me if i have done something wrong in the kernel compilation or
> something else is wrong.
> 
> 

Please, try to reproduce the problem with more recent code.
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/reiser4-for-2.6.13-4.patch.gz
is fresh reiser4 for 2.6.13.


