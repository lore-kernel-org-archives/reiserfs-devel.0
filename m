From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Fwd: reiser4progs
Date: Tue, 28 Oct 2008 02:04:11 +0300
Message-ID: <490648EB.9050700@gmail.com>
References: <ee5afd760810271159i18cb94abu92075dde4bcbf9da@mail.gmail.com> <ee5afd760810271230v7487969wd7eedee194533d9b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ee5afd760810271230v7487969wd7eedee194533d9b@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan de Kruyf <jan.de.kruyf@gmail.com>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Jan de Kruyf wrote:
> hallo Edward

hello

>
> I give up. tried to send this to the list. But the list, gmail, and I
> dont agree somehow.

it seems, the list doesn't like html signatures created by gmail

> Perhaps you are willing to pass it on?
>
> jan.
>
> ---------- Forwarded message ----------

[...]
>
>
> hallo,
> Could someone please point me in the right direction here:
>
> How do I find out if a directory entry is a (sub-)directory itself in
> the following piece of code:
> (lifted from demos/ls.c)

reiser4_object_readdir()  extracts directory
entries, and every such entry (cde) is a pair:
. stat-data key (without offset);
. null-terminated name.

IMHO this is not enough to make sure that
directory entry is a directory. You might also
want to find stat-data of each entry by its key.

>
>     reiser4_object_t *object;
>     entry_hint_t entry;
>
>
>     if (reiser4_psobj(object)->p.id.group == DIR_OBJECT) {
>         while (reiser4_object_readdir(object, &entry) > 0) {
>             printf("[%s] %s\n", reiser4_print_key(&entry.object),

This is only a lightweight non-recursive version of "ls",
which just types file names - it is not suitable for you..

I am sure there are proper tools for your needs. Unfortunately,
I can not drop you a quick detailed hint: I am not a specialist in
reiser4progs..

Thanks,
Edward.

>
>      }
>
> as background: I am writing grub2 file system code for a reiser4 boot
> partition, with help from libreiser4 and friends.
>
> regards
>
> Jan de Kruyf.
>
>

