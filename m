From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiserfs lost data
Date: Sun, 13 Jul 2008 23:43:11 +0400
Message-ID: <487A5ACF.5010809@gmail.com>
References: <18430405.post@talk.nabble.com> <487A3859.9070005@gmail.com> <18432480.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18432480.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Farafonoff <farafonoff@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Farafonoff wrote:
> Any related kernel messages?
> no kernel messages, filesystem mounted cleanly
>
> What does reiserfsck with no options report?
> It says I should try --rebuild-tree 
>
>   

So run reiserfsck with the option --rebuild-tree (why not?)

> I redirected fsck output to file, it is attached.
> http://www.nabble.com/file/p18432480/fsck.log fsck.log 
>   

