From: Hans Reiser <reiser@namesys.com>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 12:03:28 -0600
Message-ID: <44C26870.6090200@namesys.com>
References: <1992401892.20060722173244@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1992401892.20060722173244@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

We are going to give changing the paradigm a try.  The difference
between 4.1-beta and 4.0 is that different plugins are the default, and
the experimental code is in the plugins you see when mounting with the
mount option 4.1-beta.   Let's see if it works in practice.....

Hans

Pysiak Satriani wrote:

>Hello,
>
>one of the concerns of LKML folks about r4 is that namesys after
>finishing their work with r4 will "rush off" to reiser5 leaving
>r4 as "stable" in a "bugfix-mode only"
>
>I understand that way of things - you don't mess with a "stable" branch
>software.
>
>But a question arises. Will namesys keep r4 in a bugfix-only mode
>(as with reiserfs v3) or will it have resources planned not only
>for bugfixes but for updates too ?
>
>I think that's a thing that needs to be very clear.
>
>Best regards,
>Maciej
>
>
>
>
>  
>

