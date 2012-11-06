From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfscore/hashes.c
Date: Tue, 06 Nov 2012 20:47:27 +0100
Message-ID: <5099694F.8060502@gmail.com>
References: <20121106154905.GA11281@bom.nom.co>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=7q46aB8fK4Hyv03D/FUOYGT45hga3A4h4JdAlmokupA=;
        b=gp4QIfKjK2iFVL+4bfRpzzDxZraQp61ZF/u3w08I/utrqhwwOKBPzXZ8tMC1uM+c4M
         +fTQ4cemAFqFICeowNlGzZQtdIA9ktY18HDGNueJbZniDWsAs8PtXX/xJ66cSGYL93YM
         tPNDqaDBJDUyg2JbG46zAzHh2Vp7sAZ6CmqBbR7kwcCcE9QVbNCAB1Li79cXtsiItX6W
         YvZXotCqrGiRJf7FbJyRoAd8Czv8n4WrQtt/EADHmu3J4oBBZpsfKkN1aJSRRhXpQjvd
         a8wc2TOTiXp/eBfYsG9WvhfXJGWmilSWJN6A06+OZ1XYqRMl8hMmOr3etPtRwqpZQBkQ
         z3cA==
In-Reply-To: <20121106154905.GA11281@bom.nom.co>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: "Michael W. Bombardieri" <mb@ii.net>
Cc: reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

On 11/06/2012 04:49 PM, Michael W. Bombardieri wrote:
> Hi Edward,
>
> I was browsing the git repository for reiserfs...
> https://git.kernel.org/?p=3Dlinux/kernel/git/jeffm/reiserfsprogs.git;=
a=3Dsummary
> This code is entirely new to me.
>
> I have a patch which simplifies the yura_hash function in
> reiserfscore/hashes.c. Here is what it does:
>
> 1. Remove temporary variable 'c'
> 2. Remove two nested loops which always set pow=3D1
>
> I tested this using the following code on i386 and amd64.
>
> int
> main(void)
> {
>      char *test[] =3D {
>          "a",
>          "bb",
>          "ccc",
>          "dddd",
>          "eeeee",
>          "ffffff",
>          "ggggggg",
>          "red leather",
>          "yellow leather",
>          NULL
>      };
>      size_t n;
>      int i;
>      u32 x;
>
>      for (i =3D 0; test[i] !=3D NULL; i++) {
>          n =3D strlen(test[i]);
>          printf("input=3D\"%s\" len=3D%u ", test[i], n);
>          x =3D yura_hash(test[i], (int)n);
>          printf("hash=3D%lu\n", x);
>      }
>      return (0);
> }
>
> The results between my version and the original
> yura_hash are identical:
>
> input=3D"a" len=3D1 hash=3D4084352
> input=3D"bb" len=3D2 hash=3D4148480
> input=3D"ccc" len=3D3 hash=3D4802688
> input=3D"dddd" len=3D4 hash=3D11472896
> input=3D"eeeee" len=3D5 hash=3D79455104
> input=3D"ffffff" len=3D6 hash=3D772077312
> input=3D"ggggggg" len=3D7 hash=3D3531332224
> input=3D"red leather" len=3D11 hash=3D959593472
> input=3D"yellow leather" len=3D14 hash=3D410631168
>
> I'm not sure if the yura_hash function is used
> heavily, or at all. I'm sending this patch in
> case you are interested to take a look.


Hello Michael,

Your changes look OK to me.

TBH, I don't like the fact that the pow is set to 1 by such tricky ways=
 in
the mentioned nested loops: it might indicate mistakes in the original
code.

Generally I think that this hash is not heavily used: everyone uses eit=
her
r5, or tea hash, so...
A=D1=81ked-by: Edward Shishkin <edward.shishkin@gmail.com>

Thanks,
Edward.
P.S. This is a git repository of Jeff Mahoney, the reiserfs maintainer,=
 so
don't forget cc him ;)



> - Michael
>
>
> --- hashes.c	Tue Nov  6 23:21:09 2012
> +++ hashes_new.c	Tue Nov  6 23:26:26 2012
> @@ -175,37 +175,26 @@
>  =20
>   u32 yura_hash (const signed char *msg, int len)
>   {
> -    int j, pow;
> -    u32 a, c;
> -    int i;
> -
> -    for (pow=3D1,i=3D1; i < len; i++) pow =3D pow * 10;
> -
> -    if (len =3D=3D 1)
> -	a =3D msg[0]-48;
> -    else
> -	a =3D (msg[0] - 48) * pow;
> -
> -    for (i=3D1; i < len; i++) {
> -	c =3D msg[i] - 48;
> -	for (pow=3D1,j=3Di; j < len-1; j++) pow =3D pow * 10;
> -	a =3D a + c * pow;
> -    }
> -
> -    for (; i < 40; i++) {
> -	c =3D '0' - 48;
> -	for (pow=3D1,j=3Di; j < len-1; j++) pow =3D pow * 10;
> -	a =3D a + c * pow;
> -    }
> -
> -    for (; i < 256; i++) {
> -	c =3D i;
> -	for (pow=3D1,j=3Di; j < len-1; j++) pow =3D pow * 10;
> -	a =3D a + c * pow;
> -    }
> -
> -    a =3D a << 7;
> -    return a;
> +	int i, j, pow;
> +	u32 a;
> +
> +	a =3D msg[0] - 48;
> +	if (len !=3D 1) {
> +		for (i =3D 1, pow =3D 1; i < len; i++)
> +			pow *=3D 10;
> +		a *=3D pow;
> +	}
> +	for (i =3D 1; i < len; i++) {
> +		for (j =3D i, pow =3D 1; j < len - 1; j++)
> +			pow *=3D 10;
> +		a +=3D pow * (msg[i] - 48);
> +	}
> +	for (; i < 40; i++)
> +		a +=3D '0' - 48;
> +	for (; i < 256; i++)
> +		a +=3D i;
> +	a <<=3D 7;
> +	return a;
>   }
>  =20
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
