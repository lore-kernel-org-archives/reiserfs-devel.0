From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: /proc/fs/reiserfs question
Date: Tue, 15 Oct 2002 10:36:58 +0200
Message-ID: <20021015103658.6f3997ab.philippe.gramoulle@mmania.com>
References: <20021014160435.344ca55b.philippe.gramoulle@mmania.com>
	<15786.54223.785138.49029@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <15786.54223.785138.49029@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 14 Oct 2002 18:25:19 +0400
Nikita Danilov <Nikita@namesys.com> wrote:

  |  I am afraid one has to dig it out of the sources. Here is description of
  |   some fields displayed in "super", they pertain to the in-core
  |   super-block:
  | [-]
  |  I guess we should keep this information somewhere on the web-site. If
  |  you need more detailed info, let me know.

Thank nikita, this is fine for me.

I was also looking for a way to have an idea of how many files sit on a filesystem
without having to walk through the whole tree and list each of them.

Thanks,

Philippe
