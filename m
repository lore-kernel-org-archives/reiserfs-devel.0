From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for 3.11
Date: Sun, 15 Sep 2013 23:51:39 +0400
Message-ID: <5377295.oFoUDLQBZJ@intelfx-laptop>
References: <3473565.3piOE8Lf58@intelfx-laptop> <522DA671.9040006@gmail.com> <52360C7B.6080908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=7G9iysN3izsuhh7lLa8znVPgWyfyOcdveKru34caTeE=;
        b=YNFfh902SabugCKKJmQwOOtufffH26cBKPqXtCo+Jr5OZiPpI7oNgwALk2sH2nWdrh
         FWAhLeCsDJt9FA+JtDGphxbxhOodBdKdOjac61ZRePKNLn97rKASFhBJkXYzPk4q+ZpO
         CYXeyQ1CMSuKrLrbNiSd/tfPf+Qn6CuwaAhYPfdIJ1eDMUwbOyys7+zqmqGcol8/wtHU
         KC6mm3eGkLtv940aBorpjvwGOr/NyyKFNCzlH2SAm8fkeavJ4eXKjgAWpozkdk6Lf9d1
         IZQo7+BkcsNQKm3VT55nNd8e2xBbf4c6VpCi8sipOYPnVUZXD+qKUfcOI2erPllmuU32
         lbsg==
In-Reply-To: <52360C7B.6080908@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sunday 15 September 2013 at 21:37:31, Edward wrote:
> On 09/09/2013 12:44 PM, Edward Shishkin wrote:
> > On 09/06/2013 07:36 AM, Ivan Shapovalov wrote:
> >> Hi Edward!
> >>
> >> I'm sorry for the silence... The summer, as it usually happens, 
> >> turned out to
> >> be not-easier-than-studying-days (personal life and all), so 
> >> unfortunately
> >> there is not much progress with TRIM implementation for reiser4. 
> >> There is some
> >> code, but it's stability is zero.
> >>
> >> Anyway, here is my usual attempt to port reiser4 to next kernel. 3.11 
> >> got a
> >> significant API change (readdir() of file_operations changed to 
> >> iterate()),
> >> and I'm unsure if I done that correctly. But it works, unlike TRIM. :)
> >
> >
> > Cool. Thanks!!!
> >
> >
> >>
> >> (FYI, iterate() differs from readdir() mostly in that it works with a 
> >> copy of
> >> f_pos instead of with f->f_pos directly.)
> >
> >
> > AFAIK they fixed races in readdir() and friends.
> > I'll take a look at this more carefully...
> 
> 
> Vfs people have introduced a new field (.for_sync) of  struct 
> wb_writeback_work,
> it should be initialized as 1 in reiser4_sync_fs().

Ah, missed that.

> 
> The next comment is that all PF_FOO flags should be "independent". In 
> particular,
> "compound" values like 0x80000002 are unacceptable for PF_FLUSHER (is it 
> clear,
> why so?). I would recommend 0x00000001, or 0x00000002.

That seems to be a typo... Of course, I know it's a bitmask :)

> 
> In other bits the patch looks OK.
> 
> Thanks!
> Edward.

Thanks for the review! I'll fix the points and send an updated patch shortly.

-- 
Ivan Shapovalov / intelfx /
