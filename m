From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: why does reiserfs list get so much spam?
Date: Fri, 16 Sep 2005 16:41:43 +0200
Message-ID: <op.sw69rtp1d4os1z@localhost>
References: <432A9BFD.10700@mch.one.pl> <20050916104129.GA11025@kruemel> <432AA409.5070006@interia.pl> <Pine.LNX.4.63.0509161259560.21130@alpha.polcom.net> <432AAA38.9000102@mch.one.pl> <e692861c05091605406ad2908@mail.gmail.com> <op.sw64fwxad4os1z@localhost> <20050916135217.GA12930@kruemel>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050916135217.GA12930@kruemel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dnia Fri, 16 Sep 2005 15:52:17 +0200, Ingo Bormuth <ibormuth@efil.de> napis=
a=B3:

> On 2005-09-16 14:46, =A3ukasz Mierzwa wrote:
>>
>> If You will look in the headers of messages that You get from this list =
You
>> will see that there is spamassassin running on thebsh.namesys.com, it's
>> just that it is not configured good enough.
>>
>
> You're right. I use spamassassin in standard configuration with a
> threshold of 7 plus razor, pyzor and dcc. It does a very good job.
>
>

I'm using on my server MiailScanner+postfix, mailscanner does a great job o=
f integrating mta, spamassassin, clamav and his own checks, 99% of spam I g=
et is identified and moved to subfolder of my inbox. About a week ago I've =
installed sqlgrey (greylist daemon for postfix) and I am very very happy wi=
th it. My mailgraph shows that number of messages marked as spam goes down =
to zero and numer of messages rejected by server goes up. No need to filter=
 them with spamassassin, they never hit Your mailbox (or maildir :P ).

=A3ukasz Mierzwa
