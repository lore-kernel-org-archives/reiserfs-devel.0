From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: The situation at hand and in the future
Date: Sun, 30 May 2004 21:06:24 +0300
Message-ID: <20040530180624.GZ4990@nysv.org>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org> <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org> <8765adltwx.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <8765adltwx.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On Sun, May 30, 2004 at 01:13:50PM -0400, Hubert Chan wrote:

>Note that if you want to do encryption and compression, you must do
>compression first, and then encryption.  When you encrypt, you end up
>with what looks like random data, which typically has very bad
>compression characteristics (i.e. your file size is more likely to grow
>than to shrink).

But if compression is tied to size, this would change matters?

Otherwise yes..

Maybe compression and encryption should be different things?

-- 
mjt

