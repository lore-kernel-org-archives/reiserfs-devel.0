From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: 2.6.9-mm1
Date: Sat, 23 Oct 2004 19:57:12 +0300
Message-ID: <20041023165712.GR26192@nysv.org>
References: <417A7EF9.70007@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <417A7EF9.70007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:

>Please make large keys the default, and hide the ability to 
>choose small keys by taking it out of the configuration menu and burying 
>it in a .h file.

Stupid question, why have small keys at all?

Someone said once that he didn't want to use large keys because they added
no value to him and small keys wasted less space. If there are people like
this around, burying it is not cool, but if there aren't, maybe small keys
should be ripped out?

-- 
mjt

