From: Sami Farin <zi5n04xtl001@sneakemail.com>
Subject: Re: Spew ala patapsco's lotus notes server....
Date: Thu, 6 Jun 2002 21:30:32 +0300
Message-ID: <20020606183032.GC7759@ruutana.ratol.fi>
References: <85256BD0.0061CBBC.00@patapsco.com> <20020606185701.G23235@parcelfarce.linux.theplanet.co.uk>
Reply-To: Sami Farin <zi5n04xtl001@sneakemail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020606185701.G23235@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, Jun 06, 2002 at 06:57:01PM +0100, Chris Dukes wrote:
> On Thu, Jun 06, 2002 at 01:58:15PM +0000, Valdis.Kletnieks@vt.edu wrote:
> [Spew SNEEPED]
> 
> Is there any chance that the mailing list engine be modified to show the
> Received: lines that were on the email BEFORE the list processor chews
> on the email.  It would make it a lot simpler to apply a LART the guilty 
> part(y|ies) for the duplicate files SPEW.  Don't say it can't be done 
> because the netdev folks did it for their list a few months ago.

FAQ.idx says:

--- 8< ---

9.7 Limiting `Received:'' headers in outgoing messages.

  Sendmail still is being used on the majority of mail hubs. Sendmail
  has very primitive loop detection, bouncing messages based on
  excessive ``hopcount''.  The ``hopcount'' is determined by counting
  ``Received:'' headers. ezmlm by default propagates ``Received:''
  headers to facilitate message tracking. Thus, messages, especially
  from a sublist, can have a number of ``Received:'' headers that
  exceeds the ``hopcount'' set on poorly configured sendmail hosts.
  Subscription confirmation requests, warning, and probe messages have
  fewer ``Received:'' headers. Thus, a user may be able to receive
  these, but not (some of the) list messages. Of course, the best is to
  correct the configuration on the bouncing host, but this is often
  under the control of neither list owner nor user.

  To compensate for this problem, ezmlm-send(1) of ezmlm-idx->=0.313 by
  default removes all ``Received:'' headers except the top one.  They
  are still written to the archive, an can be retrieved from there using
  the ``-getv'' command.  To cause ezmlm-send(1) to pass on all the
  ``Received:'' headers, use the ezmlm-send(1) ``-r'' switch.

--- 8< ---

so try

echo|mail reiserfs-list-getv.10572@namesys.com

HTH

-- 
Safari - zi5n04xtl001@sneakemail.com
"Talk is cheap. Show me the code." - Linus Torvalds
