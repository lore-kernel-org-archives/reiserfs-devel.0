From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: another warning
Date: Thu, 18 Aug 2005 14:05:48 +0400
Message-ID: <43045D7C.6070907@namesys.com>
References: <9625752b05081802523a45dde6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9625752b05081802523a45dde6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Danny <dannydaemonic@gmail.com>
Cc: Reiserfs-List@namesys.com

Hello

Danny wrote:
> A couple days ago I got another warning.  This one sounds more
> serious, and I'm not low on free space anymore.
> 
> Aug 16 20:21:18 [kernel] reiser4[mount(16045)]: _init_read_super
> (fs/reiser4/init_super.c:180)[nikita-2608]:
> Aug 16 20:21:18 [kernel] WARNING: loop0: wrong master super block magic.
> 
> Bad magic number?  Does that mean something important was overwritten?
> 

This looks like it tried to mount loop0 device as reiser4 and the device was not formatted as reiser4.

