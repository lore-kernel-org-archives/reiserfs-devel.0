From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Sun, 20 Jul 2014 14:06:11 +0400
Message-ID: <AC6185ED-DBDD-4BCE-B6B6-631165EE69CD@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2333335.ugWK4TrHUo@intelfx-laptop> <53C2D82B.7030201@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com> <53CAE12E.7090504@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:mime-version:in-reply-to:content-type
         :content-transfer-encoding:message-id:cc:from:subject:date:to;
        bh=U8Vux00On/jiBU+DayM60i8Yikuo4tlDrTa+Hx1o3c8=;
        b=astsYPPm0zdLKZtvCj2BQU+9sd8Oqk4NZCwRhDfLz8xlTSELLDrq1poRv1+aJ6xQa5
         xyP4c7xDQmt1G95YmLcetHNBFtNBFUr1yu/0bJD3r8UT6A3PaByaSJMIsdM1TyV+iqaP
         YRQcEi72W2TjT6mOnOgSvOlROIk1KVlWyvygnnLcRWhRj1PctRuLQbXHJ5BExHz6F0Ft
         wyIbwETnbktPpszcFiSNPTi6QN54J281lh5lN7waXdEtLSLREFCR1oCjct/+ICox637W
         2K9yJtY8jWS7qvLLPHTwjD6VtvucAt3uOGI/TcicQ3LTyb3tQnYo0Rny8KZm+Teqs8Z8
         EZeA==
In-Reply-To: <53CAE12E.7090504@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>

> 20 =C9=C0=CC=D1 2014 =C7., =D7 1:20, Edward Shishkin <edward.shishkin=
@gmail.com> =CE=C1=D0=C9=D3=C1=CC(=C1):
>=20
>=20
>> On 07/14/2014 03:56 AM, Edward Shishkin wrote:
>>=20
>>> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
> [...]
>>>=20
>>> Nothing seems to call at least check_free_blocks(begin, end)...
>>=20
>>=20
>> Oh, bad... I thought all this time that extents of the delete sets a=
re still dirty
>> in the working bitmap at the moment of discard.
>> Hmm, I definitely don't want to check the whole extents for discard.=
=2E.
>=20
>=20
> False alarm, actually..
>=20
> Nothing is wrong if someone makes them dirty before issuing our disca=
rd
> requests: his changes will be committed in the next sessions of posse=
ssing
> the commit_mutex _after_ our discard. Everything is isolated.. For th=
e same
> reason we don't care if someone allocate blocks in head and tail padd=
ings
> before issuing our padded discard extents.

I was just thinking about the very same possible race...

But well, isn't the call to current_atom_complete_writes() placed befor=
e acquisition of commit_mutex? I was under impression of that relocate =
sets could be written while another atom is being committed under the m=
utex.

--
Ivan Shapovalov / intelfx /

(Sent from a phone. Havoc may be wreaked on the formatting.)

> We only need to make sure that
> they were clean at _our_ commit session.
>=20
> Anyway, let's use delayed deallocation. I like it better than aux_del=
ete_set.
> After all, we can roll everything back at every moment, if any proble=
ms..
>=20
> Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
