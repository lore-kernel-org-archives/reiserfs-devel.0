From: Ivan Pulleyn <ivan.pulleyn@gmail.com>
Subject: Re: programming methodology terminology
Date: Sun, 29 Jan 2006 23:58:28 -0800
Message-ID: <755b32b20601292358r46841346g3d8b0b0b3fcb83ba@mail.gmail.com>
References: <43DDBD1D.6030900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43DDBD1D.6030900@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

It seems like a form of layering violation to me. Conflation of
meaning for a #define is definitely undue obfuscation, if not out
right bad coding.

Ivan...

On 1/29/06, Hans Reiser <reiser@namesys.com> wrote:
> suppose there are two distinct layers of abstraction, one on top of the
> other.  Suppose someone uses the error condition names of the top layer
> in coding the bottom layer when the return values it is used for in the
> bottom layer have not the same purpose as those of the top layer, and
> when it would be an error for the return value to actually get
> propagated all the way out of the top layer.  What is this bad
> programming practice called, there is a name for it isn't there?  When
> you use a return value #define for two different meanings, is there a
> name for that?  It is generally accepted to be bad style, yes?
>
> Hans
>
