From: Hans Reiser <reiser@namesys.com>
Subject: Re: Fibration questions
Date: Mon, 19 Jul 2004 22:30:26 -0700
Message-ID: <40FCADF2.2050302@namesys.com>
References: <20040719072026.1959F15D1B@mail03.powweb.com> <40FC3E56.2020603@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FC3E56.2020603@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

David Masover wrote:

>
>
> Why beyond?  Ask each fs object (without knowing its name), "What is
> your primary type?"  Put like-typed objects together.  Simple.

Except that at look up time all you know is the name, and if the type is 
not in the name then you cannot fibrate by it.

Hans
