From: Tom Vier <tmv@comcast.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 1 Apr 2004 22:41:50 -0500
Message-ID: <20040402034150.GB2158@zero>
References: <20040330123546.GA5229@nysv.org> <20040330162451.63097.qmail@web25001.mail.ukl.yahoo.com> <16489.43144.773836.364284@laputa.namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16489.43144.773836.364284@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Mar 30, 2004 at 09:04:08PM +0400, Nikita Danilov wrote:
> A character string that is used to identify a file. In the context of
> IEEE Std 1003.1-2001, a pathname consists of, at most, {PATH_MAX} bytes,
> including the terminating null byte. It has an optional beginning slash,

interesting. i thought posix, et al said PATH_MAX *not* including the nul
term. maybe i need to change all the str[PATH_MAX+1]; definitions i've made
in wipe.

google is my friend too, and i'll try to search the various 5000 *nix-like
standards. (heh, we need to standardize on one standard - i guess that's
what unix '98 was for.)

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
