package org.ks.competition;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ks.competition.vo.Competition;
import org.springframework.jdbc.core.RowMapper;

public class CompetitionRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rset, int rowNum) throws SQLException {
		Competition c = new Competition();
		c.setCompetitionNo(rset.getInt("competition_no"));
		c.setCompetitionTitle(rset.getString("competition_title"));
		c.setCompetitionContents(rset.getString("competition_contents"));
		c.setCompetitionImg(rset.getString("competition_img"));
		c.setCompetitionVideo(rset.getString("competition_video"));
		c.setCompetitionResult(rset.getString("competition_result"));
		c.setCompetitionDate(rset.getDate("competition_date"));
		return c;
	}

}
