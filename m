From: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Quotas aand 2.5.x
Date: Wed, 15 Jan 2003 10:43:06 +0100
Message-ID: <20030115104306.51404b4c.philippe.gramoulle@mmania.com>
References: <20030114182217.4fa8f2f8.philippe.gramoulle@mmania.com>
	<20030114203842.A18999@namesys.com>
	<3E2451B0.1020905@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E2451B0.1020905@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: green@namesys.com, reiserfs-list@namesys.com, mason@namesys.com


Hi Hans,

On Tue, 14 Jan 2003 21:06:40 +0300
Hans Reiser <reiser@namesys.com> wrote:

  |  Philippe, am I right in guessing that you don't need it urgently?  If 
  |   so, I will let Chris do it, and it might take just a bit longer.

Actually, right now, we still have that nasty bug every time we run quotacheck that prenvent us from enabling them on several filerservers which is a big problem right now (that's on 2.4.x)

As i thought that now most of efforts are put into 2.5.x, i might be able to take advantage of all the new functionnalities but what i do need is Reiserfs + NFS + quota.

On the NFS part , there have been so many enhancements in 2.5.x (and on other parts as well) that i'm really eager to give it a try.

Could Chris tell me then how much time does he think it will take to have quota in 2.5.x.

I think it would be best for everybody to wait for Chris to implement quotas in 2.5.x so that people at Namesys can focus on Reiserfs v4 :o)

What do you think ?

Thanks,

Philippe
