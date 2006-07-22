From: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 21:51:28 +0200
Message-ID: <1287558327.20060722215128@wp.pl>
References: <1992401892.20060722173244@wp.pl> <44C26870.6090200@namesys.com>
Reply-To: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C26870.6090200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-list@namesys.com

Hello Hans,

Saturday, July 22, 2006, 8:03:28 PM, you wrote:

> We are going to give changing the paradigm a try.  The difference
> between 4.1-beta and 4.0 is that different plugins are the default, and
> the experimental code is in the plugins you see when mounting with the
> mount option 4.1-beta.   Let's see if it works in practice.....
I Understand. This is good news. Hm, do you think that reiser4's pluggability
is enough to have this single kernel tree (fs/reiser4) for a longer period
of time. I mean, can you predict a need of spawning something like reiser5
in the forseeable future or would fs/reiser4 + plugins be enough to do
away with the "future vision" and other "future *" stuff you've written
about ? eg. I remember reading about very granular security ACLs like
restricting a certain line in a file (like /etc/passwd)

-- 
Best regards,
Maciej


