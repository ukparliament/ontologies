# Importing route data to Data Graphs

## Route, Path, fromStep, toStep and inProcedure

We need to flag routes forming part of a non-component procedure as being not required for export, where those routes also form part of a component procedure.

### Preparation for flagging exportable routes.

We add a <code>is_included_in_export</code> boolean to the procedurerouteprocedure join table.

<pre>
	<code>
		ALTER TABLE dbo.procedurerouteprocedure
		ADD is_included_in_export BOOLEAN DEFAULT TRUE;
	</code>
</pre>

We set the <code>is_included_in_export</code> boolean to false for any route forming part of a non-component procedure, where that route also forms part of a component procedure.

### Flag duplicate EVEL routes

This update flags routes forming part of the EVEL component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 11
		)
		AND dbo.procedurerouteprocedure.procedureid != 11;
	</code>
</pre>

### Flag duplicate SLSC routes

This update flags routes forming part of the SLSC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 8
		)
		AND dbo.procedurerouteprocedure.procedureid != 8;
	</code>
</pre>

### Flag duplicate JCSI routes

This update flags routes forming part of the JCSI component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 28
		)
		AND dbo.procedurerouteprocedure.procedureid != 28;
	</code>
</pre>

### Flag duplicate SCSI routes

This update flags routes forming part of the SCSI component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 9
		)
		AND dbo.procedurerouteprocedure.procedureid != 9;
	</code>
</pre>

### Flag duplicate Commons first reading routes

This update flags routes forming part of the Commons first reading component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 41
		)
		AND dbo.procedurerouteprocedure.procedureid != 41;
	</code>
</pre>

### Flag duplicate Commons ten minute rule bill routes

This update flags routes forming part of the Commons ten minute rule bill component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 44
		)
		AND dbo.procedurerouteprocedure.procedureid != 44;
	</code>
</pre>

### Flag duplicate treaty BAT routes

This update flags routes forming part of the treaty BAT component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 61
		)
		AND dbo.procedurerouteprocedure.procedureid != 61;
	</code>
</pre>

### Flag duplicate treaty EFRA routes

This update flags routes forming part of the treaty EFRA component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 29
		)
		AND dbo.procedurerouteprocedure.procedureid != 29;
	</code>
</pre>

### Flag duplicate treaty HAC routes

This update flags routes forming part of the treaty HAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 66
		)
		AND dbo.procedurerouteprocedure.procedureid != 66;
	</code>
</pre>

### Flag duplicate treaty IAC and EAC routes

This update flags routes forming part of the treaty IAC and EAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 16
		)
		AND dbo.procedurerouteprocedure.procedureid != 16;
	</code>
</pre>

### Flag duplicate treaty ITC routes

This update flags routes forming part of the treaty ITC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 26
		)
		AND dbo.procedurerouteprocedure.procedureid != 26;
	</code>
</pre>

### Flag duplicate treaty JCHR routes

This update flags routes forming part of the treaty JCHR component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 15
		)
		AND dbo.procedurerouteprocedure.procedureid != 15;
	</code>
</pre>

### Flag duplicate treaty Lords' committees routes

This update flags routes forming part of the treaty Lords' committees component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 13
		)
		AND dbo.procedurerouteprocedure.procedureid != 13;
	</code>
</pre>

### Flag duplicate treaty NIAC routes

This update flags routes forming part of the treaty NIAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 56
		)
		AND dbo.procedurerouteprocedure.procedureid != 56;
	</code>
</pre>

### Flag duplicate treaty other Commons' committees routes

This update flags routes forming part of the treaty other Commons' committees component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 65
		)
		AND dbo.procedurerouteprocedure.procedureid != 65;
	</code>
</pre>

### Flag duplicate treaty pre-laying routes

This update flags routes forming part of the treaty pre-laying component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 62
		)
		AND dbo.procedurerouteprocedure.procedureid != 62;
	</code>
</pre>

### Flag duplicate DPRRC scrutiny reserve routes

This update flags routes forming part of the DPRRC scrutiny reserve component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 60
		)
		AND dbo.procedurerouteprocedure.procedureid != 60;
	</code>
</pre>

### Flag duplicate Great Steward of Scotland routes

This update flags routes forming part of the Great Steward of Scotland component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 40
		)
		AND dbo.procedurerouteprocedure.procedureid != 40;
	</code>
</pre>

### Flag duplicate legislative consent motion Northern Ireland routes

This update flags routes forming part of the legislative consent motion Northern Ireland component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 58
		)
		AND dbo.procedurerouteprocedure.procedureid != 58;
	</code>
</pre>

### Flag duplicate legislative consent motion Scotland routes

This update flags routes forming part of the legislative consent motion Scotland component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 46
		)
		AND dbo.procedurerouteprocedure.procedureid != 46;
	</code>
</pre>

### Flag duplicate legislative consent motion Welsh routes

This update flags routes forming part of the legislative consent motion Welsh component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 57
		)
		AND dbo.procedurerouteprocedure.procedureid != 57;
	</code>
</pre>

### Flag duplicate LRO Commons committee consideration routes

This update flags routes forming part of the LRO Commons committee consideration component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 53
		)
		AND dbo.procedurerouteprocedure.procedureid != 53;
	</code>
</pre>

### Flag duplicate LRO Commons procedure determination routes

This update flags routes forming part of the LRO Commons procedure determination component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 51
		)
		AND dbo.procedurerouteprocedure.procedureid != 51;
	</code>
</pre>

### Flag duplicate LRO draft affirmative routes

This update flags routes forming part of the LRO draft affirmative component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 49
		)
		AND dbo.procedurerouteprocedure.procedureid != 49;
	</code>
</pre>

### Flag duplicate LRO draft negative routes

This update flags routes forming part of the LRO draft negative component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 48
		)
		AND dbo.procedurerouteprocedure.procedureid != 48;
	</code>
</pre>

### Flag duplicate LRO Lords' Committee consideration routes

This update flags routes forming part of the LRO Lords' Committee consideration component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 52
		)
		AND dbo.procedurerouteprocedure.procedureid != 52;
	</code>
</pre>

### Flag duplicate LRO Lords' debates routes

This update flags routes forming part of the LRO Lords' debates component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 55
		)
		AND dbo.procedurerouteprocedure.procedureid != 55;
	</code>
</pre>

### Flag duplicate LRO Lords' procedure determination routes

This update flags routes forming part of the LRO Lords' procedure determination component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 50
		)
		AND dbo.procedurerouteprocedure.procedureid != 50;
	</code>
</pre>

### Flag duplicate local government finance report routes

This update flags routes forming part of the local government finance report component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 12
		)
		AND dbo.procedurerouteprocedure.procedureid != 12;
	</code>
</pre>

### Flag duplicate Prince of Wales' consent routes

This update flags routes forming part of the Prince of Wales' consent component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 39
		)
		AND dbo.procedurerouteprocedure.procedureid != 39;
	</code>
</pre>

### Flag duplicate Queens' consent routes

This update flags routes forming part of the Queens' consent component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 37
		)
		AND dbo.procedurerouteprocedure.procedureid != 37;
	</code>
</pre>

### Flag duplicate PNSI Commons' committee routes

This update flags routes forming part of the PNSI Commons' committee component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 77
		)
		AND dbo.procedurerouteprocedure.procedureid != 77;
	</code>
</pre>

### Flag duplicate scrutiny reserve JCHR routes

This update flags routes forming part of the scrutiny reserve JCHR component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 76
		)
		AND dbo.procedurerouteprocedure.procedureid != 76;
	</code>
</pre>

### Flag duplicate draft affirmative Lords motions routes

This update flags routes forming part of the draft affirmative Lords motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 70
		)
		AND dbo.procedurerouteprocedure.procedureid != 70;
	</code>
</pre>

### Flag duplicate draft affirmative Commons motions routes

This update flags routes forming part of the draft affirmative Commons motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 83
		)
		AND dbo.procedurerouteprocedure.procedureid != 83;
	</code>
</pre>

### Flag duplicate Draft affirmative: Joint Committee on Statutory Instruments (JCSI) Scrutiny Reserve routes

This update flags routes forming part of the Draft affirmative: Joint Committee on Statutory Instruments (JCSI) Scrutiny Reserve component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 67
		)
		AND dbo.procedurerouteprocedure.procedureid != 67;
	</code>
</pre>

### Flag duplicate Made affirmative: Commons motions routes

This update flags routes forming part of the Made affirmative: Commons motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 69
		)
		AND dbo.procedurerouteprocedure.procedureid != 69;
	</code>
</pre>

### Flag duplicate Made affirmative: Lords motions routes

This update flags routes forming part of the Made affirmative: Lords motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 84
		)
		AND dbo.procedurerouteprocedure.procedureid != 84;
	</code>
</pre>

### Flag duplicate Made negative: Lords motions routes

This update flags routes forming part of the Made negative: Lords motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 74
		)
		AND dbo.procedurerouteprocedure.procedureid != 74;
	</code>
</pre>

### Flag duplicate CRAG Treaty PAC routes

This update flags routes forming part of the CRAG Treaty PAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 64
		)
		AND dbo.procedurerouteprocedure.procedureid != 64;
	</code>
</pre>

### Flag duplicate Made negative: Referral to a Delegated Legislation Committee (DLC) routes

This update flags routes forming part of the Made negative: Referral to a Delegated Legislation Committee (DLC) component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 71
		)
		AND dbo.procedurerouteprocedure.procedureid != 71;
	</code>
</pre>

### Flag duplicate Made negative: Commons motions routes

This update flags routes forming part of the Made negative: Commons motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 72
		)
		AND dbo.procedurerouteprocedure.procedureid != 72;
	</code>
</pre>

### Flag duplicate Made negative - Commons motion to consider routes

This update flags routes forming part of the Made negative - Commons motion to consider component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 73
		)
		AND dbo.procedurerouteprocedure.procedureid != 73;
	</code>
</pre>

### Flag duplicate Draft negative: Lords motions routes

This update flags routes forming part of the Draft negative: Lords motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 81
		)
		AND dbo.procedurerouteprocedure.procedureid != 81;
	</code>
</pre>

### Flag duplicate Draft negative - Commons motion to consider routes

This update flags routes forming part of the Draft negative - Commons motion to consider component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 80
		)
		AND dbo.procedurerouteprocedure.procedureid != 80;
	</code>
</pre>

### Flag duplicate Draft negative: Commons motions routes

This update flags routes forming part of the Draft negative: Commons motions component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 78
		)
		AND dbo.procedurerouteprocedure.procedureid != 78;
	</code>
</pre>

### Flag duplicate Draft negative: Referral to a Delegated Legislation Committee (DLC) routes

This update flags routes forming part of the Draft negative: Referral to a Delegated Legislation Committee (DLC) component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 79
		)
		AND dbo.procedurerouteprocedure.procedureid != 79;
	</code>
</pre>

### Flag duplicate Made affirmative: Joint Committee on Statutory Instruments (JCSI) Scrutiny Reserve routes

This update flags routes forming part of the Made affirmative: Joint Committee on Statutory Instruments (JCSI) Scrutiny Reserve component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE dbo.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE dbo.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM dbo.procedurerouteprocedure rp
			WHERE rp.procedureid = 82
		)
		AND dbo.procedurerouteprocedure.procedureid != 82;
	</code>
</pre>

### Route proliferation checking queries

A query for Jayne to check that routes flagged as not included for export look correct.

<pre>
	<code>
		COPY (
			SELECT p.procedurename AS procedure, from_s.procedurestepname AS from_step, to_s.procedurestepname AS to_step
			FROM dbo.procedurerouteprocedure pr, dbo.procedure p, dbo.procedureroute r, dbo.procedurestep from_s, dbo.procedurestep to_s
			WHERE pr.is_included_in_export is FALSE
			AND pr.procedureid = p.id
			AND pr.procedurerouteid = r.id
			AND r.fromprocedurestepid = from_s.id
			AND r.toprocedurestepid = to_s.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/reporting/ignored-routes.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

A query for Jayne to check which routes are in more than one procedure. Includes only routes flagged as being included for export.

<pre>
	<code>
		COPY (
			SELECT
				r.id AS route_id,
				r.triplestoreid AS route_triplestore_id,
				from_step.name AS from_step_name,
				to_step.name AS to_step_name,
				procedure_routes.procedure_count AS procedure_count,
				STRING_AGG(procedure.name::text, ' | ') AS procedures
			FROM dbo.procedureroute r
			LEFT JOIN
				(
					SELECT pr.procedurerouteid, p.procedurename AS name
					FROM dbo.procedurerouteprocedure pr, dbo.procedure p
					WHERE pr.procedureid = p.id
					AND pr.is_included_in_export is TRUE
				) procedure
			ON procedure.procedurerouteid = r.id

			INNER JOIN (
				SELECT s.id, s.procedurestepname AS name
				FROM dbo.procedurestep s
	
			) from_step
			ON from_step.id = r.fromprocedurestepid

			INNER JOIN (
				SELECT s.id, s.procedurestepname AS name
				FROM dbo.procedurestep s
	
			) to_step
			ON to_step.id = r.toprocedurestepid

			INNER JOIN (
				SELECT pr.procedurerouteid, count(pr.id) AS procedure_count
				FROM dbo.procedurerouteprocedure pr
				WHERE pr.is_included_in_export is TRUE
				GROUP BY pr.procedurerouteid
	
			) procedure_routes
			ON procedure_routes.procedurerouteid = r.id
			WHERE procedure_count > 1
			GROUP BY r.id, from_step.name, to_step.name, procedure_count
			ORDER BY procedure_count DESC
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/reporting/route-profileration.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Export routes flagged as exportable.

<pre>
	<code>
		COPY (
			SELECT 
				r.id,
				r.triplestoreid AS triplestoreId,
				pr.procedureid AS inProcedure,
				CONCAT( 'Route from ', from_step.full_label, ' to ', to_step.full_label, ' in the ', p.procedurename, ' procedure' ) AS label,
				CASE
				  WHEN from_step.proceduresteptypeid = 1
				  THEN CONCAT( 'urn:procedure-editor:BusinessStep:', from_step.id )
				ELSE
				  CONCAT( 'urn:procedure-editor:Step:', from_step.id )
				END AS fromStep,

				CASE
				  WHEN to_step.proceduresteptypeid = 1
				  THEN CONCAT( 'urn:procedure-editor:BusinessStep:', to_step.id )
				ELSE
				  CONCAT( 'urn:procedure-editor:Step:', to_step.id )
				END AS toStep

			FROM dbo.procedureroute AS r, dbo.procedurerouteprocedure AS pr, dbo.procedurestep AS from_step, dbo.procedurestep AS to_step, dbo.procedure p
			
			WHERE r.id = pr.procedurerouteid
			AND from_step.id = r.fromprocedurestepid
			AND to_step.id = r.toprocedurestepid
			AND pr.is_included_in_export IS TRUE
			AND pr.procedureid = p.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/routes.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## AvailableThing, availabilityOf, Availability and hasAvailabilityStatus (for routes)

<pre>
	<code>
		COPY (
			SELECT
				r.id AS id,
				CONCAT('urn:procedure-editor:Route:',r.id) AS availabilityOf,
				r.startdate::Date AS startOn,
				r.enddate::Date AS endOn,
				'urn:procedure-editor:AvailabilityStatus:4sGJ6xVObCL4KQiPfQ2b6s' AS hasAvailabilityStatus,
				CONCAT( 'Availability of route from ', from_step.full_label, ' to ', to_step.full_label, ' in the ', p.procedurename, ' procedure' ) AS label
			
			FROM dbo.procedureroute r, dbo.procedurerouteprocedure AS pr, dbo.procedurestep AS from_step, dbo.procedurestep AS to_step, dbo.procedure p

			WHERE r.id = pr.procedurerouteid
			AND from_step.id = r.fromprocedurestepid
			AND to_step.id = r.toprocedurestepid
			AND pr.is_included_in_export IS TRUE
			AND (
				r.startdate IS NOT NULL
				OR
				r.enddate IS NOT NULL
			)
			AND pr.procedureid = p.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/route-availability.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>