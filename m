From: Hans Reiser <reiser@namesys.com>
Subject: Re: Questions about pseudo plugins
Date: Thu, 30 Mar 2006 13:16:15 -0800
Message-ID: <442C4A9F.5050909@namesys.com>
References: <442C3900.1060808@uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28418-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442C3900.1060808@uh.cu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yoanis Gil Delgado <fred@uh.cu>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>

Yoanis Gil Delgado wrote:

> Hi there:
> I've been working on the versioning plugin.
> I will like to know how can i add a pseudo file to a pseudo directory,
> dynamically. I mean whenever i detect a new version i want to create a
> pseudo file under /file.txt/versioning/version/s pseudo directory.
> Another question is about how can I iterate over directories pseudo
> files.
> For example how i can iterate over the files under
> /file.txt/versioning/version/s (remember the files under this
> directory are pseudo files which are generated dynamically).
> I know there is a way to add static pseudo files and directories, by
> adding them to pseudo_plugins array. Perhaps using the linkage field
> from pseudo_plugin. I've some more questions but i will come later
> with them.
> By the way I found this in the patch for kernel 2.6.15:
>    The function init_pseudo receives a _/const char* name  /_which is
> never used.
> That's all for now. Thanks a lot .............. yoanis
>
>
>
Thanks Yoanis.  Vs, would you answer these questions, or have zam answer
them if your plate is full for the day?

Thanks,

Hans
