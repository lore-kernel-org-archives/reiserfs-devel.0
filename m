From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Spew ala patapsco's lotus notes server....
Date: Fri, 07 Jun 2002 13:20:50 +0200
Message-ID: <m3r8jjjpwt.fsf@merlin.emma.line.org>
References: <85256BD0.0061CBBC.00@patapsco.com>
	<20020606185701.G23235@parcelfarce.linux.theplanet.co.uk>
	<20020606183032.GC7759@ruutana.ratol.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020606183032.GC7759@ruutana.ratol.fi> (Sami Farin's message
 of "Thu, 6 Jun 2002 21:30:32 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Sami Farin <zi5n04xtl001@sneakemail.com> writes:

>   excessive ``hopcount''.  The ``hopcount'' is determined by counting
>   ``Received:'' headers. ezmlm by default propagates ``Received:''
>   headers to facilitate message tracking. Thus, messages, especially
>   from a sublist, can have a number of ``Received:'' headers that
>   exceeds the ``hopcount'' set on poorly configured sendmail hosts.
>   Subscription confirmation requests, warning, and probe messages have
>   fewer ``Received:'' headers. Thus, a user may be able to receive
>   these, but not (some of the) list messages. Of course, the best is to
>   correct the configuration on the bouncing host, but this is often
>   under the control of neither list owner nor user.

ezmlm could instead keep the original Received: headers as
X-Original-Received:, that should hide them from sendmail, but still
allow tracing.

-- 
Matthias Andree
