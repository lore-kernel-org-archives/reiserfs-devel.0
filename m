From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 11:07:35 +0200
Message-ID: <200403311107.35550.christian.mayrhuber@gmx.net>
References: <20040331084335.GE5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040331084335.GE5229@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 31 March 2004 10:43, Markus TXrnqvist wrote:

> I'm not sure either what Hans Reiser meant by a macro, does that mean
> a settable variable? It's a decent compromise, I think. As someone
> else stated, let's just hope for an inoffensive default.

Yes, you can see a C macro as a compile time variable settable in the source 
code.

The evaluation result of a macro is copied to the caller's location during 
compile.

You can use macros to define some default values or to prevent code 
duplication and the overhead of a function call.

-- 
lg, Chris
