From: Ashish <ashish_pspl@yahoo.com>
Subject: Re: ReiserFS on Linux 2.6.7 kernel
Date: Tue, 29 Jun 2004 23:13:55 -0700 (PDT)
Message-ID: <20040630061355.89760.qmail@web53310.mail.yahoo.com>
References: <200406282207.01984.camel78@iprimus.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406282207.01984.camel78@iprimus.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,
Thanks for the information. I still am not entirely
clear about the versioning and have a couple of
questions.

1. As you said, reiserfs is included in the 2.6.7
kernel. Does that mean that the reiserfs bundled with
this kernel has all the latest updates and patches ?
Is there any kind of version information maintained to
this effect ?  How do I know if I am in need of any
updates to the reiserfs I have in my kernel tree ?

2. I am aware that 3.6.17 is reiserfstools as you
mentioned. Is that the latest one available ?

Thanks in advance
Ashish
                      

--- Michael Milverton <camel78@iprimus.com.au> wrote:
> Hi Ashish,
> 	There are two reiser filesystems, a new one that is
> still being debugged and 
> an older one that is in wide use. The older one is
> the one that is in the 
> kernel you reffered to, the new one is not. The new
> filesystem is called 
> Reiser4. This is very new and is not yet in wide
> use. 
> 
> As far as I know the 3.6.17 you are referring to is
> the reiserfsprogs, eg the 
> tools that manage the reiserfs filesystem. These
> should come with your 
> distribution. Apart from that just compile reiserfs
> into you kernel and you 
> should up and running.
> 
> On Mon, 28 Jun 2004 09:31 pm, Ashish Rathi wrote:
> > Hi
> >
> > I am pretty new to ReiserFS and have a very basic
> > question to ask.
> >
> > I recently upgraded to the 2.6.7 kernel available
> on
> > kernel.org. On the ReiserFS download page, I see
> that
> > ReiserFS 4 is being still listed as "experimental"
> for
> > the Linux 2.6 kernel.
> > So what version of ReiserFS does the 2.6.7 kernel
> > include ? Is it 3.6.17 ? Where do I look in order
> to
> > find this info ?
> >
> > I'll be glad if someone could help me out here.
> >
> > Thanks
> > Ashish
> >
> >
> >
> >
> >
> >
> >
> >
> > __________________________________
> > Do you Yahoo!?
> > New and Improved Yahoo! Mail - Send 10MB messages!
> > http://promotions.yahoo.com/new_mail
> 
> -- 
> GNU/Linux: Secure, Stable, Free
> Michael <camel78@iprimus.com.au>
> 

> ATTACHMENT part 2 application/pgp-signature 




		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 
