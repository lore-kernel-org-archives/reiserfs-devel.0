From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 20:11:54 +0200
Message-ID: <20041109181154.GF26192@nysv.org>
References: <b28a886104110808555d3f59dc@mail.gmail.com> <1099933755.13138.4.camel@localhost> <b28a886104110823161fe3a30d@mail.gmail.com> <1099997754.1373.72.camel@tribesman.namesys.com> <b28a886104110907416476fb50@mail.gmail.com> <662c77ee04110909473d0f6dd3@mail.gmail.com> <b28a886104110909531ee7d29a@mail.gmail.com> <852912156.20041109185702@tnonline.net> <b28a8861041109100612d142bb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b28a8861041109100612d142bb@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy West <jkwest@gmail.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Tue, Nov 09, 2004 at 01:06:21PM -0500, Jeremy West wrote:
>Ok.  I wouldn't call myself a linux newbie by any means.  However,
>I've never had to do console logging or network logging.  Are there
>some good docs somewhere on how to set this up?

Network logging is well-documented in the kernel sources.
Documentation/networking/netconsole.txt

Recommend you compile netconsole and network card support monolithically.

-- 
mjt

