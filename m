From: Basil Chupin <blchupin@tpg.com.au>
Subject: Re: What does this mean?
Date: Fri, 12 Jul 2002 15:48:27 +1000
Message-ID: <3D2E6DAB.9050400@tpg.com.au>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au> <200207081228.56302.kuba@mareimbrium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kuba Ober <kuba@mareimbrium.org>
Cc: reiserfs-list@namesys.com

Kuba Ober wrote:

 >>I really do not know what is causing this every-5-seconds access. This
 >>is why I am trying to check the integrity of the fs as part of my
 >>exercise of finding the reason for the access.
 >>
 >>
 >This is normal and expected for your kernel version, AFAIK. Integrity 
of the
 >fs has nothing to do with it (alas, do maintain the integrity, please ;-)
 >
 >Cheers, Kuba Ober
 >
 >
 >
I take the opporunity in this message to thank all who have responded to
my queries as doing so will save me some typing :-).

Re what you just said about this being "normal and expected for your
kernel version, AFAIK" I need to say that this is the reason why I am
querying this accessing because I don't believe that it is - and i'll
give my reason in a minute. Firstly, I want to say that  following advice
from at least a couple of people I was able to work out (I am new to
Linux so don't really know what I am doing) how to check the reiser fs
on my system. It is fine, of course. I needed to have it checked out,
though, because I had to eliminate this as a variable in my attempt to
find out why my HD(s) is/are being accessed by something every 5 seconds.

Please let me give a brief resume of why I am trying to find out why my 
HD is being accessed every 5 seconds (actually it is also occurring on 
another computer at home and a friend's machine -- and all are running 
SuSE 8.0).

  I first asked this Q isn another forum and received the general reply 
that it all had to do with the reiser fs -- which I didn't really 
believe. Why? because I didn't recall having this "problem" when I was 
running SuSE v7.2 with reiser fs. But just to be sure I started doing 
some testing.

I have another HD which I use for testing purposes and on this one I 
installed SuSE v7.2 undere reiserfs. There was no 5 second accessing on 
the HD.

I then installed SuSE 8 with ext3 (because someone said that the 5 
seconds-thingie only happened under reiser) - and I still got the 5 secs 
access. So, it wasn't confined to reiserfs.

Following the comment in this forum that I can only run reiserfsck if 
the fs is not mounted or if I am in single-user mode, I went into 
single-user mode and guess what? As soon as one goes into single-user 
mode the 5 second accessing stops! Interesting, no?

And just to add more interest to the whole epic, I decided to do another 
  install of SuSE 8 under reiserfs on my test drive. I did an identical 
install as I made on my other 2 computers and --- you guessed it: this 
time there is NO 5 second accessing of the HD (on the test system)!

So, that's the story, and I am still wondering why 3 systems runing SuSE 
8 under reiserfs are having the HDs accessed every 5 seconds yet this 
does not occur on a (near identical) test system installed recently.

Cheers.







