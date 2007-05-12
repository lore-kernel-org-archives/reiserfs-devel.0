From: Toby Thain <toby@smartgames.ca>
Subject: Re: Why reiser does a disk write on every sync() call?
Date: Sat, 12 May 2007 10:56:49 -0400
Message-ID: <E7801829-5267-4254-8FA0-E2A2316192BE@smartgames.ca>
References: <08A9A3213527A6428774900A80DBD8D803BB80B4@xmb-sjc-222.amer.cisco.com> <200703272254.46500.vs@namesys.com> <2f4958ff0705120603x4da5bcdq2c48c9394586f6c@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0705120603x4da5bcdq2c48c9394586f6c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


On 12-May-07, at 9:03 AM, Grzegorz Ja=C5=9Bkiewicz wrote:

> sounds like useless waste of time and space
> You haven't stated the reason, why it has to create and commit empty
> transaction.

Why'd you call sync()?

--T

>
> --=20
> GJ

