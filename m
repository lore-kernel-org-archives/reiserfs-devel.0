From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: The situation at hand and in the future
Date: Sat, 29 May 2004 15:48:16 +0300
Message-ID: <20040529124816.GV4990@nysv.org>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <200405281953.i4SJrhbG017334@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405281953.i4SJrhbG017334@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com

On Fri, May 28, 2004 at 03:53:43PM -0400, Valdis.Kletnieks@vt.edu wrote:

>> Persistent over boots? I'd like the passphrase and key to survive
>> a boot...
>No you don't.
>If the passphrase and key are persistent, then an attacker can get your data.

I think we are talking about the same/different thing :)

Of course I don't want the files to become unencrypted after a boot.
I meant that I want the files to be locked _with the same key_ after
a boot. Because the unlocking/locking key must be always the same.

-- 
mjt

