From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 22:05:03 +0200
Message-ID: <523B58EF.5070906@gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so> <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so> <CABYXC3ahREZe3ZxhphULa-W_+w1Ww5dXGvEU9DOBWWpL-Nqt0g@mail.gmail.com> <20130919180949.Horde.nfafj_-4N9u8NKKzsKcYlw1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=KZc6X01vJQYvv6IvaeuydjdAg0eKKj/VEvN4TA48FHg=;
        b=Ekhj3cpghmsvtewrtaC9kWM11DoFcuB3GsMO4keFwdeFofMwrDZA4Q47RZBsHMVWIc
         4TMmJp5513aNWPncP/4WI7QNPK9grZcJTVXRckpK7q6fPG7CHAtoS5n6K76GgvV9f0pX
         ZQNm5GoAwLIhy9DQh18+IPinryXGKHUJ/FUbAnFH4wdyJ04lsVJDrVrdCY3B6xzb9olS
         xkmmTqXoWI6uK4+axnLRsgLf9QWEjq+/wqehE50d9z8tq8+xoj1k4vyMPCIJzT35o3iB
         5snro5qvom6k57uHS8VIS0GQfKMEfKTc41fMd5dCt4hEsXtRpBwzSoAM73Re5wX2EW+p
         C44A==
In-Reply-To: <20130919180949.Horde.nfafj_-4N9u8NKKzsKcYlw1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1251"; format="flowed"
To: Mathieu Belanger <m@thieu.so>
Cc: Christopher Gentile <cnjgentile@gmail.com>, Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Cool, thanks!
I'll concentrate then on fixing problem with non-removable files..

Edward.


19.09.2013 20:09, Mathieu Belanger =EF=E8=F8=E5=F2:
>
> I have ported the code to the new shrinker API (kernel 3.12-rc1) and=20
> removed the support for the old API a have added earlier.
>
> It compile but did not test yet.
>
> Here the diff to apply on the current Ivan patch (for Edward or other=
=20
> who don't use git):
>
>
> @@ -31,9 +31,11 @@
>   * Shrinks d_cursor_cache. Scan LRU list of unused cursors, freeing=20
> requested
>   * number. Return number of still freeable cursors.
>   */
> -static int d_cursor_shrink(struct shrinker *shrink, struct=20
> shrink_control *sc)
> +static unsigned long d_cursor_shrink_scan(struct shrinker *shrink,=20
> struct shrink_control *sc)
>  {
> -  if (sc->nr_to_scan !=3D 0) {
> +  unsigned long freed =3D 0;
> +  unsigned long remain =3D sc->nr_to_scan;
> +  if (remain !=3D 0) {
>      dir_cursor *scan;
>
>      spin_lock(&d_c_lock);
> @@ -41,12 +43,18 @@ static int d_cursor_shrink(struct shrinker=20
> *shrink, struct shrink_control *sc)
>        scan =3D list_entry(cursor_cache.next, dir_cursor, alist);
>        assert("nikita-3567", scan->ref =3D=3D 0);
>        kill_cursor(scan);
> -      --sc->nr_to_scan;
> -      if (sc->nr_to_scan =3D=3D 0)
> +      --remain;
> +      freed++;
> +      if (remain =3D=3D 0)
>          break;
>      }
>      spin_unlock(&d_c_lock);
>    }
> +  return freed;
> +}
> +
> +static unsigned long d_cursor_shrink_count (struct shrinker *shrink,=
=20
> struct shrink_control *sc)
> +{
>    return d_cursor_unused;
>  }
>
> @@ -58,7 +66,8 @@ static int d_cursor_shrink(struct shrinker *shrink,=
=20
> struct shrink_control *sc)
>   * shrunk only if system is really tight on memory.
>   */
>  static struct shrinker d_cursor_shrinker =3D {
> -  .shrink =3D d_cursor_shrink,
> +  .count_objects =3D d_cursor_shrink_count,
> +  .scan_objects =3D d_cursor_shrink_scan,
>    .seeks =3D DEFAULT_SEEKS << 3,
>  };
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe=20
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
