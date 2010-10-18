From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 compile issue
Date: Mon, 18 Oct 2010 21:44:59 +0200
Message-ID: <4CBCA3BB.8080402@gmail.com>
References: <AANLkTimJiCRhvAYqK=sdonHSjf9exh_yqhJo+aLJkhvT@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimJiCRhvAYqK=sdonHSjf9exh_yqhJo+aLJkhvT@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Viji V Nair <viji@fedoraproject.org>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Viji V Nair wrote:
> Hi,
>
>  =20

Hello.

> I am getting the following warning when I compile resier4 for 2.6.34.
> The module is getting compiled anyway, can I ignore this?
>
> make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn M=3Dfs/reiser4
>
> fs/reiser4/plugin/node/node40.c: In function =91create_item_node40=92=
:
> fs/reiser4/plugin/node/node40.c:852: warning: ignoring return value o=
f
> =91__copy_from_user=92, declared with attribute warn_unused_result
>  =20

Yup, not urgent issue..
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
