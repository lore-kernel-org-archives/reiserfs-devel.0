From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs/emacs incompatibility/bug ?
Date: Mon, 30 Sep 2002 10:39:12 +0400
Message-ID: <20020930103912.A4045@namesys.com>
References: <H38NL8$7E21F734BCE1FC3CA596D1CF9DE21BC4@voila.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <H38NL8$7E21F734BCE1FC3CA596D1CF9DE21BC4@voila.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "arthur.chereau" <arthur.chereau@voila.fr>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Sep 30, 2002 at 08:34:20AM +0200, arthur.chereau wrote:
> $ cat test
> version 2
> $ ls -i test*
> 1505190 test 1505189 test~
> $ emacs test
> $ cat test
> version 3
> $ ls -i test*
> 1505191 test 1505189 test~
> The fact that it doesn't happen on ext2 makes me think it's related to Reiserfs.

What kernel versions have you tried (that show this behavior)?

Bye,
    Oleg
