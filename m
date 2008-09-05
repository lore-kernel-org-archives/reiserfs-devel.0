From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: reiserfs do_journal_end unnecessary hd wake up?
Date: Fri, 5 Sep 2008 02:03:49 +0200
Message-ID: <200809050203.49346.volker.armin.hemmann@tu-clausthal.de>
References: <loom.20080904T211127-782@post.gmane.org> <200809050154.00318.volker.armin.hemmann@tu-clausthal.de> <1df1788c0809041659i3b3a8fb4sa5c44b74976f9a73@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1df1788c0809041659i3b3a8fb4sa5c44b74976f9a73@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

On Friday 05 September 2008, Br=C3=A1ulio Barros de Oliveira wrote:
> hello volker,
>
> running tree command on /tmp i couldn't associate any file with
> konsole. that's the result
> [braulio@brauliopresto tmp]$ tree
> .
>
> |-- kde-root [error opening dir]
>
> `-- kde4-braulio
>
>     |-- kde-braulio
>     |
>     |   |-- 28165-cm81.skz
>     |   |-- 86714-PicoNet.skz
>     |   |-- closeditems
>     |   |-- konqueror-crash-X31257.log
>     |   |-- konqueror-crash-X31258.log
>     |   |-- konqueror-crash-X31259.log
>     |   |-- konqueror-crash-X31262.log
>     |   |-- konqueror-crash-X31265.log
>     |
>     |   `-- ksycoca -> /var/tmp/kdecache-braulio/ksycoca
>
>     `-- ksocket-braulio
>
>         |-- KSMserver__0
>         |-- kdeinit-:0
>         |-- kdeinit4__0
>         |-- kdeinit__0
>         |-- klauncherMT3820.slave-socket
>         |-- klauncherT31205.slave-socket
>
>         `-- klaunchergALyma.slave-socket
>
> 5 directories, 15 files

try lsof  (as superuser). lsof |grep konsole and prepare to be surprise=
d.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
